<?php
class ModelExtensionTotalJBuyGetCombo extends Model {
	public function getTotal($total) {
		$this->load->language('extension/total/jbuygetcombo');

		$this->load->model('jbuygetcombo/jbuygetcombo');

		// $results =  $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetCombos();

		// $a  = 8;
		// $b = 2;
		// echo "return cauient :" . $a/$b;

		// echo "\n\n";
		// echo "return remander :" . $a%$b;

		// https://docs.magento.com/m1/ce/user_guide/marketing/price-rule-shopping-cart-buy-x-get-y-free.html


		// Buy 5 Get 2 Free with maximum of 4 free items allowed.

		// Where

		// $X = 5;

		// $Y = 2;

		// $M = 4;

		// // Maximum Qty Discount = (5+2)*(4/2)=(7)*(2)=14
		// $d = ($X+$Y)*($M/$Y);
		// echo $d;
		// die;

		/*
		Sam Curtis = 18

		HTC Touch HD: 28,
		Palm Treo Pro: 29

		Thomas Singer = 26

		Canon EOS 5D: 30,
		Nikon D300: 31

		Roie Jaque = 25

		iPod Touch: 32,
		Samsung SyncMaster 941BW: 33

		Robert Little = 12

		iPod Shuffle: 34,
		Product 8: 35

		Genevieve Jones = 14

		iPod Nano: 36,
		iPhone: 40

		Mae Peshlakai = 15

		iMac: 41,
		Apple Cinema 30&quot;: 42

		Filmer Lalio = 16

		MacBook: 43,
		MacBook Air: 44

		Other Artists = 17

		MacBook Pro: 45,
		Sony VAIO: 46

		Allison Manuelito = 20

		HP LP3065: 47,
		iPod Classic: 48

		Jay Woody = 35

		Samsung Galaxy Tab 10.1: 49

		*/

		$cart_products = $this->cart->getProducts();
		// echo "cart_products";
		// echo "\n\n";
		// print_r($cart_products);
		// echo "\n\n\n";

		$combos = array();
		foreach ($cart_products as $key => $cart_product) {
			$jbuygetcombo = $this->load->controller('jbuygetcombo/jbuygetcombo/listing', array('product_id' => $cart_product['product_id']));

			if($jbuygetcombo) {

				if(!empty($jbuygetcombo['jbuygetcombo_info']['jbuygetcombo_id']) && !isset($combo[$jbuygetcombo['jbuygetcombo_info']['jbuygetcombo_id']])) {

					$combos[$jbuygetcombo['jbuygetcombo_info']['jbuygetcombo_id']] = $jbuygetcombo;
				}





			}
		}

		foreach ($combos as $jbuygetcombo_id => $combo) {






		$discount_total = 0;

		$title = $this->language->get('text_total');


		if(!empty($combo['jbuygetcombo_info'])) {

			$title = $combo['jbuygetcombo_info']['text_order_total'];

			$get_product_ids = $buy_product_ids = array();

			$combo['jbuygetcombo_info']['collection_from'] = array();

			if($combo['jbuygetcombo_info']['buy_products']) {
				$combo['jbuygetcombo_info']['collection_from'][] = 'buy_products';
				$buy_product_ids = array_merge($buy_product_ids, $combo['jbuygetcombo_info']['buy_products']);
			}

			if($combo['jbuygetcombo_info']['get_products']) {
				$combo['jbuygetcombo_info']['collection_from'][] = 'get_products';
				$get_product_ids = array_merge($get_product_ids, $combo['jbuygetcombo_info']['get_products']);
			}

			$this->load->model('catalog/category');
			$category_ids = array();
			foreach ($combo['jbuygetcombo_info']['buy_categories'] as $buy_categories) {
				$category_info = $this->model_catalog_category->getCategory($buy_categories);
				if($category_info) {
					$category_ids[] = $buy_categories;
				}
			}
			if($category_ids) {
				$combo['jbuygetcombo_info']['collection_from'][] = 'buy_categories';
				$category_products = $this->model_jbuygetcombo_jbuygetcombo->getCategoriesProducts($category_ids);
				$buy_product_ids = array_merge($buy_product_ids, $category_products);
			}

			$category_ids = array();
			foreach ($combo['jbuygetcombo_info']['get_categories'] as $get_categories) {
				$category_info = $this->model_catalog_category->getCategory($get_categories);
				if($category_info) {
					$category_ids[] = $get_categories;
				}
			}
			if($category_ids) {
				$combo['jbuygetcombo_info']['collection_from'][] = 'get_categories';
				$category_products = $this->model_jbuygetcombo_jbuygetcombo->getCategoriesProducts($category_ids);
				$get_product_ids = array_merge($get_product_ids, $category_products);
			}

			$this->load->model('catalog/manufacturer');
			$manufacturer_ids = array();
			foreach ($combo['jbuygetcombo_info']['buy_manufacturers'] as $buy_manufacturers) {
				$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($buy_manufacturers);
				if($manufacturer_info) {
					$manufacturer_ids[] = $buy_manufacturers;
				}
			}
			if($manufacturer_ids) {
				$combo['jbuygetcombo_info']['collection_from'][] = 'buy_manufacturers';
				$manufacturer_products = $this->model_jbuygetcombo_jbuygetcombo->getManufacturersProducts($manufacturer_ids);
				$buy_product_ids = array_merge($buy_product_ids, $manufacturer_products);
			}


			$manufacturer_ids = array();
			foreach ($combo['jbuygetcombo_info']['get_manufacturers'] as $get_manufacturers) {
				$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($get_manufacturers);
				if($manufacturer_info) {
					$manufacturer_ids[] = $get_manufacturers;

				}
			}
			if($manufacturer_ids) {
				$combo['jbuygetcombo_info']['collection_from'][] = 'get_manufacturers';
				$manufacturer_products = $this->model_jbuygetcombo_jbuygetcombo->getManufacturersProducts($manufacturer_ids);
				$get_product_ids = array_merge($get_product_ids, $manufacturer_products);
			}

			// create new keys in array for further use
			$combo['jbuygetcombo_info']['buy_product_ids'] = array_unique($buy_product_ids);
			$combo['jbuygetcombo_info']['get_product_ids'] = array_unique($get_product_ids);

			// echo "combo";
			// echo "\n\n";
			// print_r($combo);
			// echo "\n\n\n";


			$total_buy_quantities = 0;
			$total_get_quantities = 0;
			$buy_products_cart_keys = array();
			$get_products_cart_keys = array();

			// echo "qty_buy : " . $combo['jbuygetcombo_info']['qty_buy'];
			// echo "\n<br>\n";
			// echo "qty_get : " . $combo['jbuygetcombo_info']['qty_get'];
			// echo "\n<br>\n";
			// echo "buy_product_ids : ";
			// echo "\n<br>\n";
			// print_r($combo['jbuygetcombo_info']['buy_product_ids']);
			// echo "\n<br>\n";
			// echo "get_product_ids : ";
			// echo "\n<br>\n";
			// print_r($combo['jbuygetcombo_info']['get_product_ids']);
			// echo "\n<br>\n";

			// // print_r($combo['jbuygetcombo_info']);
			// // echo "\n<br>\n";
			// echo "collection_from : ";
			// echo "\n<br>\n";
			// print_r($combo['jbuygetcombo_info']['collection_from']);
			// echo "\n<br>\n";


			$buyGetOnAll = function($cart_qty, $qty_buy, $qty_get) {
				$remainder = $cart_qty % ($qty_buy + $qty_get);
				$number = ($cart_qty - $remainder) / ($qty_buy + $qty_get);
				$items_get = max(0, $remainder - $qty_buy) + ($number * $qty_get);
				$items_buy = $cart_qty - $items_get;

				return array(
					'items_buy' => $items_buy,
					'items_get' => $items_get
				);
			};


			$single_product_offer = in_array('buy_products', $combo['jbuygetcombo_info']['collection_from']) && in_array('get_products', $combo['jbuygetcombo_info']['collection_from']) && count($combo['jbuygetcombo_info']['collection_from']) == 2;

			foreach ($cart_products as $key => $cart_product) {

				$cart_product_qty_get = $cart_product_qty_buy = $cart_product['quantity'];


				// if($jbuygetcombo_id == 6 && $cart_product['product_id']==49) {
					// here we need to check if current product is in both buy and get items? If so, then divide total_buy quantities and total_get_quantities accordingly.
				if($single_product_offer && in_array($cart_product['product_id'], $combo['jbuygetcombo_info']['buy_product_ids']) && in_array($cart_product['product_id'], $combo['jbuygetcombo_info']['get_product_ids'])) {

					// echo 'cart_product.quantity : ' . $cart_product['quantity'];
					// echo "\n<br>\n";

					$items_buy_get = $buyGetOnAll($cart_product['quantity'], $combo['jbuygetcombo_info']['qty_buy'], $combo['jbuygetcombo_info']['qty_get']);
					// print_r($items_buy_get);
					// die;

					$cart_product_qty_get = $items_buy_get['items_get'];
					$cart_product_qty_buy = $items_buy_get['items_buy'];

				}

				// }

				// check if product is in buy_product_ids
				if(in_array($cart_product['product_id'], $combo['jbuygetcombo_info']['buy_product_ids'])) {
					$buy_products_cart_keys[] = $key;
					$total_buy_quantities += $cart_product_qty_buy;
				}

				// check if product is in get_product_ids
				if(in_array($cart_product['product_id'], $combo['jbuygetcombo_info']['get_product_ids'])) {
					$get_products_cart_keys[] = $key;
					$total_get_quantities += $cart_product_qty_get;
				}

			}

			// echo "buy_products_cart_keys :";
			// echo "\n<br>\n";
			// print_r($buy_products_cart_keys);
			// echo "\n<br>\n";
			// echo "get_products_cart_keys : ";
			// print_r($get_products_cart_keys);
			// echo "\n<br>\n";
			// echo "total_buy_quantities : " . $total_buy_quantities;
			// echo "\n<br>\n";
			// echo "total_get_quantities : " . $total_get_quantities;
			// echo "\n<br>\n";

			// die;
			// echo "\n<br>\n";
			// echo "\n<br>\n";
			// echo "\n<br>\n";

			// here we check if we found any cart product which is in buy products, get products, total buy quantities greater than 0, total get quantities greater than 0

			if($buy_products_cart_keys && $get_products_cart_keys && $total_buy_quantities && $total_get_quantities) {


				// verify if we need to give discount
				// if combo buy quantities equal as buy quantities in cart or if buy quantities in cart divided by combo buy quantities and remander is 0
				// and
				// if combo get quantities equal as get quantities in cart or if get quantities in cart divided by combo get quantities and remander is 0

				$give_discount = true;

				// echo "combo name: ";
				// echo $combo['jbuygetcombo_info']['name'];
				// echo "\n<br>\n";
				// echo 'total_get_quantities : ' . $total_get_quantities;
				// echo "\n<br>\n";
				// echo 'total_buy_quantities ('. $total_buy_quantities .') % combo.jbuygetcombo_info.qty_buy ('. $combo['jbuygetcombo_info']['qty_buy'] .') ';
				// echo "\n<br>\n";
				// echo $total_buy_quantities % $combo['jbuygetcombo_info']['qty_buy'];
				// echo 'combo.jbuygetcombo_info.qty_buy ('. $combo['jbuygetcombo_info']['qty_buy'] .')';
				// echo "\n<br>\n";
				// echo 'combo.jbuygetcombo_info.qty_get ('. $combo['jbuygetcombo_info']['qty_get'] .')';
				// echo "\n<br>\n";
				// echo 'total_buy_quantities ('. $total_buy_quantities .')';
				// echo "\n<br>\n";
				// echo 'total_get_quantities ('. $total_get_quantities .')';

				// echo "\n<br>\n";
				// echo "\n<br>\n";
				// $give_discount =
				// ($combo['jbuygetcombo_info']['qty_buy'] > 0) && (($total_buy_quantities == $combo['jbuygetcombo_info']['qty_buy']) || ($total_buy_quantities % $combo['jbuygetcombo_info']['qty_buy'] === 0) )
				// &&
				// ($combo['jbuygetcombo_info']['qty_get'] > 0) && (($total_get_quantities == $combo['jbuygetcombo_info']['qty_get']) || ($total_get_quantities % $combo['jbuygetcombo_info']['qty_get'] === 0));


				if($give_discount) {


				$cauent =  $total_buy_quantities / $combo['jbuygetcombo_info']['qty_buy'];

				// echo "cauent : " . $cauent;
				// echo "\n<br>\n";


				$can_discounted = true;
				$available_discounted_qty = 0;
				if($cauent < 1) {
					// no discount apply
					$can_discounted = false;
				} else {
					$available_discounted_qty = floor($cauent) * $combo['jbuygetcombo_info']['qty_get'];
				}

				// echo  'available_discounted_qty :' . $available_discounted_qty;
				// echo "\n<br>\n";
				// $ittems = $buyGetOnAll(($total_buy_quantities+$total_get_quantities), $combo['jbuygetcombo_info']['qty_buy'], $combo['jbuygetcombo_info']['qty_get']);

				// echo "\n<br>\n";

				// print_r($ittems);
				// echo "\n<br>\n";
				// echo "get_products_cart_keys : ";
				// print_r($get_products_cart_keys);
				// echo "\n<br>\n";
				// echo "\n<br>\n";
				if($can_discounted && $available_discounted_qty > 0) {

				// sort get product cart keys asc to price. lowest price comes first and soo on 0,1,2,3,4,5,...

				$title_products = array();

				$array = array();
				foreach ($get_products_cart_keys as $key => $get_products_cart_key) {
					$array[$key] = $cart_products[$get_products_cart_key]['price'];
				}

				// https://www.php.net/manual/en/array.sorting.php
				array_multisort($array, SORT_ASC, $get_products_cart_keys);

				$use_discounted_qty = $available_discounted_qty;
				// echo "use_discounted_qty :".  $use_discounted_qty;

				foreach ($get_products_cart_keys as $get_products_cart_key) {

					$cart_product = $cart_products[$get_products_cart_key];

					// https://math.stackexchange.com/questions/3051000/apply-buy-x-get-y-discount-on-n-products
					// https://stackoverflow.com/questions/34653111/math-for-buy-x-get-y-for-z

					if($use_discounted_qty <= 0) {
						break;
					}

					$qty_to_use = 0;
					$single_item_discount = false;
					$single_item_discount_qty = 0;

					if($single_product_offer && in_array($cart_product['product_id'], $combo['jbuygetcombo_info']['buy_product_ids']) && in_array($cart_product['product_id'], $combo['jbuygetcombo_info']['get_product_ids'])) {

						$items_buy_get = $buyGetOnAll($cart_product['quantity'], $combo['jbuygetcombo_info']['qty_buy'], $combo['jbuygetcombo_info']['qty_get']);
						$single_item_discount = true;

						$single_item_discount_qty = $items_buy_get['items_get'];
					}

					for ($i=0; $i < $cart_product['quantity']; $i++) {
						if($single_item_discount) {
							if($single_item_discount_qty <= 0) {
								break;
							}
							if($single_item_discount_qty > 0 && $use_discounted_qty > 0) {
								// print_r($cart_product);
								// echo "\n<br>\n";
								// echo "single_item_discount_qty : ". $single_item_discount_qty;
								// echo "\n<br>\n";
								$single_item_discount_qty--;
								$qty_to_use++;
								$use_discounted_qty--;
							}
						} else {
							if($use_discounted_qty > 0) {
								$qty_to_use++;
								$use_discounted_qty--;
							}
						}
					}

					$title_products[] = $cart_product['name'];

					// echo "\n<br>\n";
					// echo "\n<br>\n";

					// we only consider product price without tax price, as of tax is always payable by user

					// if discount is free, then make complete product as free. We cover only product price without tax
					if('free' == $combo['jbuygetcombo_info']['discount_type']) {

						$useit = $cart_product['price'] * $qty_to_use;

						$discount_total += $useit;
					}

					// if discount is fixed then we only add discount value as discont
					if('fixed' == $combo['jbuygetcombo_info']['discount_type']) {

						$useit = $combo['jbuygetcombo_info']['discount_value'] * $qty_to_use;

						$discount_total += $useit;
					}

					// if discount is perent then we add discount only percentage value of product price
					if('percent' == $combo['jbuygetcombo_info']['discount_type']) {
						$useit = ($cart_product['price'] * $combo['jbuygetcombo_info']['discount_value'] / 100) * $qty_to_use;

						$discount_total += $useit;
					}

					unset($cart_products[$get_products_cart_key]);
				}



				// echo "give_discount :" . $give_discount;
				// echo "\n<br>\n";
				// echo "\n<br>\n";
				// echo "\n<br>\n";
				}
				}

				// die;


			}


		}
		// echo "\n\n";
		// echo "discount_total : " . $discount_total;
		// die;

		if($discount_total) {

			$title .= ' ( '. implode(", ", $title_products) .' )';
			$total['totals'][] = array(
				'code'       => 'total_jbuygetcombo',
				'title'      => $title,
				'value'      => -$discount_total,
				'sort_order' => $this->config->get('total_jbuygetcombo_sort_order')
			);

			$total['total'] -= $discount_total;
		}

		}
	}
}