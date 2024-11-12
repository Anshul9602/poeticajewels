<?php

class ModelExtensionModuleShoppingFeeder extends Model {
    const RANDOM_STRING = 'The mice all ate cheese together.';
    const MAX_TIMEOUT = 300; //5 minutes

    public $version = '1.2.1';

    public function auth(array $headers, $incomingScheme, $incomingMethod)
    {
//        return true;
        //check the API key
        $incomingApiKey = '';
        $incomingAuthTimestamp = strtotime('1970-00-00');
        $incomingSignature = '';
        foreach ($headers as $key => $value)
        {
            if (strtolower('X-SFApiKey') == strtolower($key))
            {
                $incomingApiKey = $value;
            }
            if (strtolower('X-SFTimestamp') == strtolower($key))
            {
                $incomingAuthTimestamp = $value;
            }
            if (strtolower('X-SFSignature') == strtolower($key))
            {
                $incomingSignature = $value;
            }
        }

        $sslInFront = false;
        $useSsl = ($sslInFront == null) ? false : $sslInFront;

        $apiKeys = $this->getApiKeys();

        if (!$useSsl || ($useSsl && $incomingScheme == 'https'))
        {
            //check the timestamp
            if (time() - $incomingAuthTimestamp <= self::MAX_TIMEOUT)
            {
                $localApiKey = $apiKeys['api_key'];
                if ($localApiKey == $incomingApiKey)
                {
                    $localApiSecret = $apiKeys['api_secret'];

                    $stringToSign = $incomingMethod . "\n" .
                        $incomingAuthTimestamp . "\n" .
                        self::RANDOM_STRING;

                    if (function_exists('hash_hmac'))
                    {
                        $signature = hash_hmac('sha256', $stringToSign, $localApiSecret);
                    }
                    elseif (function_exists('mhash'))
                    {
                        $signature = bin2hex(mhash(MHASH_SHA256, $stringToSign, $localApiSecret));
                    }
                    else
                    {
                        return 'Authentication failed: Appropriate hashing function does not exist.';
                    }

                    if ($incomingSignature == $signature)
                    {
                        return true;
                    }
                    else
                    {
                        return 'Authentication failed: invalid credentials.';
                    }
                }
                else
                {
                    return 'Authentication failed: invalid API key.';
                }
            }
            else
            {
                return 'Authentication failed: timeout exceeded.';
            }
        }
        else
        {
            return 'Authentication failed: non-secure connection';
        }
    }

    public function getApiKeys()
    {
        $localApiKey = $this->config->get('shoppingfeeder_apikey');
        $localApiSecret = $this->config->get('shoppingfeeder_apisecret');

        return array(
            'api_key' => $localApiKey,
            'api_secret' => $localApiSecret
        );
    }

    private function getProductInfo($product, $lastUpdate = null)
    {
        $categories = $this->model_catalog_product->getCategories($product['product_id']);

        $longestCategoryPathCount = 0;
        $longestCategoryPath = '';
        foreach ($categories as $category)
        {
            $categoryPathCount = 0;
            $categoryId = $category['category_id'];

            $thisCategory = $this->model_catalog_category->getCategory($categoryId);
            if (isset($thisCategory) && isset($thisCategory['name']))
            {
                $categoryPath = $thisCategory['name'];
                while ($thisCategory['parent_id'] > 0)
                {
                    $thisCategory = $this->model_catalog_category->getCategory($thisCategory['parent_id']);
                    $categoryPath = $thisCategory['name'] . ' > ' . $categoryPath;

                    $categoryPathCount++;
                }
            }
            else
            {
                $categoryPath = '';
            }

            if ($categoryPathCount > $longestCategoryPathCount)
            {
                $longestCategoryPathCount = $categoryPathCount;
                $longestCategoryPath = $categoryPath;
            }
        }

        $categoryPath = $longestCategoryPath;

        $p = array();

        /**
         * Variants (options) are not currently supported, due to lack of combination limiting and custom images
         * using out-of-the-box opencart. Some extensions fix this, but not possible to support all
         */
        /*
        $options = $this->model_catalog_product->getProductOptions($product['product_id']);

        $consolidatedOptions = array();

        if (count($options) >0 )
        {
            foreach ($options as $option)
            {
                $o = array();
                $optionId = $option['option_id'];
                $o['name'] = $option['name'];
                $o['value'] = $option['value'];

                $consolidatedOptions[$optionId] = $o;
                //loop through option values and create pseudo ID for variant
                if (count($option['product_option_value']) > 0)
                {
                    $ov = array();
                    foreach ($option['product_option_value'] as $optionOptions)
                    {
                        $ov['value'] = $optionOptions['name'];
                        $ov['quantity'] = $optionOptions['quantity'];
                        $ov['price_effect'] = intval($optionOptions['price_prefix'].'1') * $this->tax->calculate($optionOptions['price'], $product['tax_class_id'], $this->config->get('config_tax'));
                        $ov['weight'] = intval($optionOptions['weight_prefix'].'1') * $optionOptions['weight'];
                        $consolidatedOptions[$optionId]['options'][] = $ov;
                    }
                }
            }
        }
        */

        $p['internal_id'] = $product['product_id'];
        $p['internal_variant_id'] = '';

        //if we have previously captured this product and it hasn't changed, don't send through full payload
        $wasPreviouslyCaptured = !is_null($lastUpdate) && isset($product['date_modified']) && strtotime($product['date_modified']) < $lastUpdate && $product['date_modified'] != '0000-00-00 00:00:00';
        if ($wasPreviouslyCaptured)
        {
            if ($product['date_modified'] != '0000-00-00 00:00:00')
            {
                $p['internal_update_time'] = $product['date_modified'];
            }
            else
            {
                $p['internal_update_time'] = date("c", strtotime("now"));
            }
        }
        else
        {
//            var_dump($product);
//            exit();
            $p['title'] = html_entity_decode($product['name']);
            $p['description'] = html_entity_decode($product['description']);
            $p['mpn'] = (isset($product['mpn']) && !empty($product['mpn'])) ? $product['mpn'] : $product['model'];
            $p['sku'] = html_entity_decode($product['sku']);
            $p['manufacturer'] = html_entity_decode($product['manufacturer']);
            $p['brand'] = html_entity_decode(isset($product['brand']) ? $product['brand'] : $product['manufacturer']);
            $p['quantity'] = $product['quantity'];
            $p['availability'] = ($product['quantity'] > 0) ? 'in stock' : 'out of stock';

            if ($product['date_modified'] != '0000-00-00 00:00:00')
            {
                $p['internal_update_time'] = $product['date_modified'];
            }
            else
            {
                $p['internal_update_time'] = date("c", strtotime("now"));
            }

            $p['image_url'] = $product['image_root'].$product['image'];//$this->model_tool_image->resize($product['image'], 500, 500);
            if (file_exists(DIR_IMAGE . $product['image']))
            {
                $p['image_modified_time'] = date("c", filemtime(DIR_IMAGE . $product['image']));
            }

            $p['category'] = $categoryPath;
            $p['weight'] = isset($product['weight']) ? $product['weight'] : 0.00;
            $p['length'] = isset($product['length']) ? $product['length'] : 0.00;
            $p['width'] = isset($product['width']) ? $product['width'] : 0.00;
            $p['height'] = isset($product['height']) ? $product['height'] : 0.00;
            $p['price'] = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
            $p['sale_price'] = !is_null($product['special']) ? $this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')) : '';

            $sellingPrice = (float)$product['special'] ? $product['special'] : $product['price'];

            $p['delivery_cost'] = 0.00;
            $p['tax'] = ($product['tax_class_id'] && $this->config->get('config_tax')) ? 0.00 : $this->tax->getTax($sellingPrice, $product['tax_class_id']);
            $p['availability_date'] = $product['date_available'];

            $p['gtin'] = !empty($product['isbn']) ? $product['isbn'] :
                (!empty($product['ean']) ? $product['ean'] :
                    (!empty($product['jan']) ? $product['jan'] :
                        (!empty($product['upc']) ? $product['upc'] : '')));

            $p['url'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $product['product_id']));

            $attributes = $this->model_catalog_product->getProductAttributes($product['product_id']);
            foreach ($attributes as $attributeGroup)
            {
                foreach ($attributeGroup['attribute'] as $attribute)
                {
                    $p['attributes'][$attribute['attribute_id']] = $attribute['text'];
                }
            }

            //add standard product attributes

            $imageGallery = array();
            foreach ($this->model_catalog_product->getProductImages($product['product_id']) as $image)
            {
                $imageGallery[] = $product['image_root'].$image['image'];//$this->model_tool_image->resize($image['image'], 500, 500);
            }
            $p['extra_images'] = $imageGallery;
        }

        return $p;
    }

    public function getOffers($data = array(), $lastUpdate = null)
    {
        $this->load->model('catalog/product');
        $this->load->model('catalog/category');
        $this->load->model('tool/image');

        $dbProducts = $this->model_catalog_product->getProducts($data);
        $storeUrl = $this->config->get('config_url');
        $storeUrlSsl = $this->config->get('config_ssl');
        if (is_null($storeUrlSsl) || empty($storeUrlSsl))
        {
            $storeUrlSsl = str_replace('http://', 'https://', $storeUrl);
        }

        if ($this->request->server['HTTPS']) {
            $imageRoot = $storeUrlSsl . 'image/';
        } else {
            $imageRoot = $storeUrl . 'image/';
        }

        $offers = array();

        if ($dbProducts)
        {
            foreach ($dbProducts as $product)
            {
                $product['image_root'] = $imageRoot;
                $offers[] = $this->getProductInfo($product, $lastUpdate);
            }
        }

        return $offers;
    }

    public function getOffer($offerId)
    {
        $this->load->model('catalog/product');
        $this->load->model('catalog/category');
        $this->load->model('tool/image');

        $dbProduct = $this->model_catalog_product->getProduct($offerId);
        $storeUrl = $this->config->get('config_url');

        if ($this->request->server['HTTPS']) {
            $imageRoot = $this->config->get('config_ssl') . 'image/';
        } else {
            $imageRoot = $this->config->get('config_url') . 'image/';
        }

        $offers = array();

        if ($dbProduct)
        {
            $dbProduct['image_root'] = $imageRoot;
            $offers[] = $this->getProductInfo($dbProduct);
        }

        return $offers;
    }

    public function getOrderInfo($dbOrder)
    {
        $order = array();

        $order_id = $dbOrder['order_id'];
        $order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

        $lineItems = array();
        $lineItemsSubtotal = 0;
        $lineItemsTaxTotal = 0;
        foreach ($order_product_query->rows as $order_product) {
            $option_data = array();

            $order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product['order_product_id'] . "'");

            foreach ($order_option_query->rows as $option) {
                $value = '';
                if ($option['type'] != 'file') {
                    $value = $option['value'];
                }

                $option_data[] = array(
                    'name'  => $option['name'],
                    'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                );
            }

            $lineItemPrice = $order_product['price'] + ($this->config->get('config_tax') ? $order_product['tax'] : 0);
            $lineItemTotal = $order_product['total'] + ($this->config->get('config_tax') ? ($order_product['tax'] * $order_product['quantity']) : 0);
            $lineItemTax = $this->config->get('config_tax') ? ($order_product['tax'] * $order_product['quantity']) : 0;
            $lineItems[] = array(
                'product_id' => $order_product['product_id'],
                'name'     => $order_product['name'],
                'model'    => $order_product['model'],
                'option'   => $option_data,
                'quantity' => $order_product['quantity'],
                'price'    => $lineItemPrice,
                'total'    => $lineItemTotal
            );

            $lineItemsSubtotal += $lineItemTotal;
            $lineItemsTaxTotal += $lineItemTax;
        }

        $orderTotals = $this->model_account_order->getOrderTotals($order_id);
        $shipping = 0;
        $tax = 0;
        $subTotal = 0;
        foreach ($orderTotals as $total) {
            switch ($total['code'])
            {
                case 'shipping':
                    $shipping += $total['value'];
                    break;
                case 'tax':
                    $tax += $total['value'];
                    break;
                case 'sub_total':
                    $subTotal += $total['value'];
                    break;
            }
        }

        //normalise order data for ShoppingFeeder
        $order['order_id'] = $order_id;
        $order['order_date'] = $dbOrder['date_added'];
        $order['store_order_number'] = $dbOrder['order_id'];
        $order['store_order_user_id'] = $dbOrder['customer_id'];
        $order['store_order_currency'] = $dbOrder['currency_code'];
        $order['store_total_price'] = $dbOrder['total'];
        $order['store_total_line_items_price'] = $subTotal;
        $order['store_total_tax'] = $tax;
        $order['store_order_total_discount'] = 0;
        $order['store_shipping_price'] = $shipping;
        $order['line_items'] = $lineItems;

        return $order;
    }

    public function getOrders($data = array())
    {
        $sql = "SELECT o.*, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS status FROM `" . DB_PREFIX . "order` o";

        if (isset($data['filter_order_status'])) {
            $implode = array();

            $order_statuses = explode(',', $data['filter_order_status']);

            foreach ($order_statuses as $order_status_id) {
                $implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
            }

            if ($implode) {
                $sql .= " WHERE (" . implode(" OR ", $implode) . ")";
            } else {

            }
        } else {
            $sql .= " WHERE o.order_status_id > '0'";
        }

        if (!empty($data['filter_order_id'])) {
            $sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
        }

        if (!empty($data['from_date']) && !empty($data['to_date'])) {
            $sql .= " AND DATE(o.date_added) >= DATE('" . $this->db->escape($data['from_date']) . "') AND DATE(o.date_added) <= DATE('" . $this->db->escape($data['to_date']) . "')";
        }

        $sort_data = array(
            'o.order_id',
            'customer',
            'status',
            'o.date_added',
            'o.date_modified',
            'o.total'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY o.order_id";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        $dbOrders =  $query->rows;

        $orders = array();

        if ($dbOrders)
        {
            $this->load->model('account/order');

            foreach ($dbOrders as $dbOrder)
            {
                $orders[$dbOrder['order_id']] = $this->getOrderInfo($dbOrder);
            }
        }

        return $orders;
    }

    public function getOrder($orderId)
    {
        $sql = "SELECT o.*, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS status FROM `" . DB_PREFIX . "order` o";
        $sql .= " WHERE o.order_id = '" . (int)$orderId . "'";

        $query = $this->db->query($sql);

        $dbOrders =  $query->rows;

        $orders = array();

        if ($dbOrders)
        {
            $this->load->model('account/order');

            foreach ($dbOrders as $dbOrder)
            {
                $orders[$dbOrder['order_id']] = $this->getOrderInfo($dbOrder);
            }
        }

        return $orders;
    }

    public function getAttributes()
    {
        $attributes = array();
        /**
         * Attributes are categorised in groups, so we'll make them look like GROUP::LABEL
         */
        $sql = "SELECT *, (SELECT agd.name FROM " . DB_PREFIX . "attribute_group_description agd WHERE agd.attribute_group_id = a.attribute_group_id AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS attribute_group FROM " . DB_PREFIX . "attribute a LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE ad.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        $query = $this->db->query($sql);

        foreach ($query->rows as $attribute)
        {
            $attributes[$attribute['attribute_id']] = $attribute['attribute_group'].'::'.$attribute['name'];
        }

        return $attributes;
    }

    public function getVersion()
    {
        return $this->version;
    }
}
