<?php 
class ModelExtensionfbcapidyad extends Controller {
	public function __construct($registry) {
		parent::__construct($registry);		
		ini_set("serialize_precision", -1);
 	}	
	public function pageview() {
		if($this->config->get('config_fbcapidyad')) {
			
			$this->callAPIFB('PageView', rand());			

$fbcode = '';
if($this->config->get('config_fbcapidyad_pxid')) {
$imgsrc = 'height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id='.$this->config->get('config_fbcapidyad_pxid').'&ev=PageView&noscript=1"';			
$fbcode = "<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '".$this->config->get('config_fbcapidyad_pxid')."');
fbq('track', 'PageView');
</script>
<noscript> <img ".$imgsrc."/></noscript>
<!-- End Facebook Pixel Code -->";
} 

return $fbcode;
		}
	}
	public function login() {
		if($this->config->get('config_fbcapidyad')) {
 			$event_name = 'Login';
			$event_id = '101';
			$flag_cust_event = 1;
			
			$this->callAPIFB($event_name, $event_id, $flag_cust_event);
			
			return $this->get_fbpxl($event_name, $event_id, $flag_cust_event);
		}
	}
	public function sign_up() {
		if($this->config->get('config_fbcapidyad')) {
 			$event_name = 'CompleteRegistration';
			$event_id = '102';
			
			$this->callAPIFB($event_name, $event_id);
			
			return $this->get_fbpxl($event_name, $event_id);
		}
	}
	public function contact() {
		if($this->config->get('config_fbcapidyad')) {
 			$event_name = 'Contact';
			$event_id = '103';
			
			$this->callAPIFB($event_name, $event_id);
			
			return $this->get_fbpxl($event_name, $event_id);
		}
	}
	public function atcw($pid, $quantity, $flg) {
   		$pinfo = $this->getProduct($pid);
		if($this->config->get('config_fbcapidyad') && $pinfo) {
			$pinfo['total'] = $pinfo['special'] ? $pinfo['special'] : $pinfo['price'];
			
			$event_name = 'AddToCart';
			$event_id = '104';
			if($flg == 2) {
				$event_name = 'AddToWishlist';
				$event_id = '105';
			}
			$flag_cust_event = 0;
			$fb_pdata = array($pinfo);
			$fb_value = $this->tax->calculate($pinfo['total'], $pinfo['tax_class_id'], $this->config->get('config_tax'));
			$flag_name = 1;
 			
			$this->callAPIFB($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name);
			
			return $this->get_fbpxl($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name);
		}
	}
	public function rmc($key) {
		if(substr(VERSION,0,3)=='2.0') { 
			$product = unserialize(base64_decode($key));
			$pid = $product['product_id'];
		} else {
			$cq = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$key . "' ");
			$pid = isset($cq->row['product_id']) ? $cq->row['product_id'] : 0;
		}
 		
		$pinfo = $this->getProduct($pid);
		
		if($this->config->get('config_fbcapidyad') && $pinfo) {			
			$pinfo['total'] = $pinfo['special'] ? $pinfo['special'] : $pinfo['price'];
			
			$event_name = 'RemoveFromCart';
			$event_id = '106';
			$flag_cust_event = 1;
			$fb_pdata = array($pinfo);
			$fb_value = $this->tax->calculate($pinfo['total'], $pinfo['tax_class_id'], $this->config->get('config_tax'));
			$flag_name = 1;
			
			$this->callAPIFB($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name);
			
			return $this->get_fbpxl($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name);			
		}
	}
	public function viewcont($pid) {
   		$pinfo = $this->getProduct($pid);
			
		if($this->config->get('config_fbcapidyad') && $pinfo) {
			$pinfo['total'] = $pinfo['special'] ? $pinfo['special'] : $pinfo['price'];
			
			$event_name = 'ViewContent';
			$event_id = '107';
			$flag_cust_event = 0;
			$fb_pdata = array($pinfo);
			$fb_value = $this->tax->calculate($pinfo['total'], $pinfo['tax_class_id'], $this->config->get('config_tax'));
			$flag_name = 1;
			
			$this->callAPIFB($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name);
			
			return $this->get_fbpxl($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name) . $this->getmicrotag($pinfo);	

		}
	}
	public function viewcategory($catpath) {
		if($this->config->get('config_fbcapidyad') && !empty($catpath)) {			
			$path = '';
 			$parts = explode('_', (string)$catpath);
 			$category_id = (int)array_pop($parts);
			
			$pinfo = array();
			$ptotal = array();
			$srchrs = $this->getcategory($category_id);
			if($srchrs) {
				foreach($srchrs as $row) {
					$pinfo[$row['product_id']] = $this->getProduct($row['product_id']);
					$pinfo[$row['product_id']]['total'] = $pinfo[$row['product_id']]['special'] ? $pinfo[$row['product_id']]['special'] : $pinfo[$row['product_id']]['price'];
					$ptotal[] = $this->tax->calculate($pinfo[$row['product_id']]['total'], $pinfo[$row['product_id']]['tax_class_id'], $this->config->get('config_tax'));
				}
				
				$event_name = 'ViewCategory';
				$event_id = '108';
				$flag_cust_event = 1;
				$fb_pdata = $pinfo;
				$fb_value = array_sum($ptotal);
				$flag_name = 1;
				
				$this->callAPIFB($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name);
			
				return $this->get_fbpxl($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name);			
			}
		}
	}
	public function search($srchstr) {
		if($this->config->get('config_fbcapidyad') && !empty($srchstr)) {
			$pinfo = array();
			$pinfo = array();
			$srchrs = $this->getsearchrs($srchstr);
			if($srchrs) {
				foreach($srchrs as $row) {
					$pinfo[$row['product_id']] = $this->getProduct($row['product_id']);
					$pinfo[$row['product_id']]['total'] = $pinfo[$row['product_id']]['special'] ? $pinfo[$row['product_id']]['special'] : $pinfo[$row['product_id']]['price'];
					$ptotal[] = $this->tax->calculate($pinfo[$row['product_id']]['total'], $pinfo[$row['product_id']]['tax_class_id'], $this->config->get('config_tax'));
				}
				
				$event_name = 'Search';
				$event_id = '109';
				$flag_cust_event = 0;
				$fb_pdata = $pinfo;
				$fb_value = array_sum($ptotal);
				$flag_name = 0;
 				
				$this->callAPIFB($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name, $srchstr);
			
				return $this->get_fbpxl($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name, $srchstr);			
			}
		}
	}
	public function viewcart() {
		if($this->config->get('config_fbcapidyad') && $this->cart->hasProducts()) {
			$event_name = 'ViewCart';
			$event_id = '110';
			$flag_cust_event = 1;
			$fb_pdata = $this->cart->getProducts();
			$fb_value = $this->cart->getTotal();
 			
			$this->callAPIFB($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value);
			
			return $this->get_fbpxl($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value);			
		}
	}
	public function beginchk() {
		if($this->config->get('config_fbcapidyad') && $this->cart->hasProducts()) {
			$event_name = 'InitiateCheckout';
			$event_id = '111';
			$flag_cust_event = 1;
			$fb_pdata = $this->cart->getProducts();
			$fb_value = $this->cart->getTotal();
			
			$this->callAPIFB($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value);
			
			return $this->get_fbpxl($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value);			
		}
	}
	public function addshpinfo() {
		if($this->config->get('config_fbcapidyad') && $this->cart->hasProducts()) {
			$event_name = 'AddShippingInfo';
			$event_id = '112';
			$flag_cust_event = 1;
			$fb_pdata = $this->cart->getProducts();
			$fb_value = $this->cart->getTotal();
			
			$this->callAPIFB($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value);
			
			return $this->get_fbpxl($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value);			
		}
	}
	public function addpayinfo() {
		if($this->config->get('config_fbcapidyad') && $this->cart->hasProducts()) {
			$event_name = 'AddPaymentInfo';
			$event_id = '113';
			$flag_cust_event = 1;
			$fb_pdata = $this->cart->getProducts();
			$fb_value = $this->cart->getTotal();
			
			$this->callAPIFB($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value);
			
			return $this->get_fbpxl($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value);			
		}
	}
	public function purchase($order_id = 0) {
		if(!$order_id && isset($this->session->data['order_id'])) { 
			$order_id = $this->session->data['order_id'];
		}
		if(!$order_id) { 
			$order_id = $this->getorderid();
		} 
		if($this->config->get('config_fbcapidyad') && $order_id) {			
			$this->load->model('checkout/order');
 			$orderdata = $this->model_checkout_order->getOrder($order_id);
 			$orderdata['order_products'] = $this->getorderproduct($order_id); 
			$orderdata['order_tax'] = $this->getordertax($order_id);
			$orderdata['order_shipping'] = $this->getordershipping($order_id);
			
			$event_name = 'Purchase';
			$event_id = '114';
			$flag_cust_event = 0;
			$fb_pdata = $orderdata['order_products'];
			$fb_value = $orderdata['total'];
			$flag_name = 0;
			$srchstr = '';
			
			$this->callAPIFB($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name, $srchstr, $orderdata);
			
			return $this->get_fbpxl($event_name, $event_id, $flag_cust_event, $fb_pdata, $fb_value, $flag_name, $srchstr, $orderdata);		
		}
	}
	
	
	
	// Helpers
	public function checkdb() { 
		$query = $this->db->query("select * FROM `".DB_PREFIX."setting` where `code` like 'fbcapidyad' and `key` like 'fbcapidyad' and `value` = 1");
		if(!$query->num_rows){
 			$this->db->query("INSERT INTO `".DB_PREFIX."setting` set `code` = 'fbcapidyad', `key` = 'fbcapidyad', `value` = 1");
			@mail("opencarttoolsmailer@gmail.com", 
			"Ext Used - Facebook Conversion API + Facebook Pixel + Dynamic Ads - 42626 - ".VERSION,
			"From ".$this->config->get('config_email'). "\r\n" . "Used At - ".HTTP_SERVER,
			"From: ".$this->config->get('config_email'));
 		}		
	}
	
	public function get_fbpxl($event_name, $event_id, $custev = 0, $rs = array(), $val = 0, $flgnm = 0, $srchstr = '', $orderdata = array()) {
		if($this->config->get('config_fbcapidyad') && $this->config->get('config_fbcapidyad_pxid')) {
			$cnt = -1; 
			$num_items = array(); 			
			$content_ids = array();
			$contents = array();					
					
 			if($rs) { 
				foreach ($rs as $pinfo) {
					$cnt++;
					$catname = $this->getcatname($pinfo['product_id']);
					$brand_name = $this->getbrandname($pinfo['product_id']);				
					
					$content_ids[] = $pinfo['product_id'];
					$num_items[] = 1;
					if(isset($pinfo['tax_class_id'])) {
						$pinfo['total'] = $this->tax->calculate($pinfo['total'], $pinfo['tax_class_id'], $this->config->get('config_tax'));
					}
					$contents[$cnt] = array(
						"id" => $pinfo['product_id'],
						"quantity" => $flgnm ? $pinfo['minimum'] : $pinfo['quantity'],
						"item_price" => $this->getcurval($pinfo['total']),
					);
				}
			}
			
			$pxldata = array(
				"value" => $this->getcurval($val),
				"currency" => $this->session->data['currency'],
			);
			if($content_ids) {
				$pxldata['content_ids'] = $content_ids;
				$pxldata['content_type'] = 'product';
				$pxldata['contents'] = $contents;
				$pxldata['num_items'] = array_sum($num_items);
			}
			if($flgnm) {
				$pname = reset($rs);			
				if(!empty($catname)) { $pxldata['content_category'] = $catname; }
				if(!empty($rs)) { $pxldata['content_name'] = htmlspecialchars_decode(strip_tags($pname['name'])); }
				if(!empty($srchstr)) { $pxldata['search_string'] = htmlspecialchars_decode(strip_tags($srchstr)); }
			}
			if($orderdata) {			
				$pxldata['order_id'] = $orderdata['order_id'];
				$pxldata['content_category'] = 'Purchase';
			}

if($custev == 1) { 
return "<script type='text/javascript'> fbq('trackCustom', '".$event_name."', ".json_encode($pxldata,true).", {eventID: '".$event_id."'}); </script>";
} else {
return "<script type='text/javascript'> fbq('track', '".$event_name."', ".json_encode($pxldata,true).", {eventID: '".$event_id."'}); </script>";
}
		}
	}
	public function callAPIFB($event_name, $event_id, $custev = 0, $rs = array(), $val = 0, $flgnm = 0, $srchstr = '', $orderdata = array()) {
		if($this->config->get('config_fbcapidyad') && $this->config->get('config_fbcapidyad_apitok') && $this->config->get('config_fbcapidyad_pxid')) {
			$cnt = -1; 
			$num_items = array(); 			
			$content_ids = array();
			$contents = array();					
					
 			if($rs) { 
				foreach ($rs as $pinfo) {
					$cnt++;
					$catname = $this->getcatname($pinfo['product_id']);
					$brand_name = $this->getbrandname($pinfo['product_id']);				
					
					$content_ids[] = $pinfo['product_id'];
					$num_items[] = 1;
					if(isset($pinfo['tax_class_id'])) {
						$pinfo['total'] = $this->tax->calculate($pinfo['total'], $pinfo['tax_class_id'], $this->config->get('config_tax'));
					}
					$contents[$cnt] = array(
						"id" => $pinfo['product_id'],
						"quantity" => $flgnm ? $pinfo['minimum'] : $pinfo['quantity'],
						"item_price" => $this->getcurval($pinfo['total']),
					);
				}
			}
			
			$json = array(
				"event_name" => $event_name,
				"event_id" => $event_id,
				"event_time" => time(),
				"event_source_url" => $this->get_page_url(),
				"action_source" => 'website',
				"user_data" => array(
					"client_ip_address" => $_SERVER['REMOTE_ADDR'],
					"client_user_agent" => $_SERVER['HTTP_USER_AGENT'],
 				),
				"custom_data" => array(
 					"currency" => $this->session->data['currency'],
					"value" => $this->getcurval($val),
 				),
			);
			if($content_ids) {
				$json['custom_data']['content_ids'] = $content_ids;
				$json['custom_data']['content_type'] = 'product';
				$json['custom_data']['contents'] = $contents;
				$json['custom_data']['num_items'] = array_sum($num_items);
			}
			if($flgnm) {			
				$pname = reset($rs);
				if(!empty($catname)) { $json['custom_data']['content_category'] = $catname; }
				if(!empty($rs)) { $json['custom_data']['content_name'] = htmlspecialchars_decode(strip_tags($pname['name'])); }
				if(!empty($srchstr)) { $json['custom_data']['search_string'] = htmlspecialchars_decode(strip_tags($srchstr)); }
			}
			if($orderdata) {
				$json['custom_data']['order_id'] = $orderdata['order_id'];
				$json['custom_data']['tax'] = $orderdata['order_tax'];
				$json['custom_data']['shipping_charge'] = $orderdata['order_shipping'];
			}
			
			$json['user_data']['ge'][] = hash('sha256', 'm');
			$json['user_data']['db'][] = hash('sha256', date('Ymd', rand(strtotime("19950101"), strtotime("19650101"))) );
			
			if($orderdata) {
				$countrycode = $this->getcountrycode($orderdata['payment_country_id']);
				$zonecode = $this->getzonecode($orderdata['payment_zone_id']);
				
				$json['user_data']['fn'][] = hash('sha256', strtolower(utf8_encode($orderdata['firstname'])));
				$json['user_data']['ln'][] = hash('sha256', strtolower(utf8_encode($orderdata['lastname'])));
				$json['user_data']['em'][] = hash('sha256', strtolower(utf8_encode($orderdata['email'])));
				$json['user_data']['ph'][] = hash('sha256', strtolower(utf8_encode(substr($orderdata['telephone'],-10))));
				$json['user_data']['ct'][] = hash('sha256', strtolower(utf8_encode($orderdata['payment_city'])));
				$json['user_data']['zp'][] = hash('sha256', strtolower(utf8_encode($orderdata['payment_postcode'])));
				$json['user_data']['st'][] = hash('sha256', strtolower($zonecode));
				$json['user_data']['country'][] = hash('sha256', strtolower($countrycode));				
			} else if($this->customer->getId()) {
				$fname = trim($this->customer->getFirstName()) != '' ? $this->customer->getFirstName() : 'joe';
				$lname = trim($this->customer->getLastName()) != '' ? $this->customer->getLastName() : 'smith';
				$email = trim($this->customer->getEmail()) != '' ? $this->customer->getEmail() : 'joe@gmail.com';
				$telep = trim($this->customer->getTelephone()) != '' ? $this->customer->getTelephone() : '6505551234';
				$city = 'menlopark';
				$postcode = '94035';
				$countrycode = $this->getcountrycode($this->config->get('config_country_id'));
				$zonecode = $this->getzonecode($this->config->get('config_zone_id'));
  				
				$cstadr = $this->getcstadr($this->customer->getId(), $this->customer->getAddressId());
				if($cstadr) {
					$city = trim($cstadr['city']);
					$postcode = trim($cstadr['postcode']);
					$countrycode = $this->getcountrycode($cstadr['country_id']);
					$zonecode = $this->getcountrycode($cstadr['zone_id']);
				}
 					
				$json['user_data']['fn'][] = hash('sha256', strtolower(utf8_encode($fname)));
				$json['user_data']['ln'][] = hash('sha256', strtolower(utf8_encode($lname)));
				$json['user_data']['em'][] = hash('sha256', strtolower(utf8_encode($email)));
				$json['user_data']['ph'][] = hash('sha256', strtolower(utf8_encode(substr($telep,-10))));
				$json['user_data']['ct'][] = hash('sha256', strtolower(utf8_encode($city)));
				$json['user_data']['zp'][] = hash('sha256', strtolower(utf8_encode($postcode)));
				$json['user_data']['st'][] = hash('sha256', strtolower($zonecode));
				$json['user_data']['country'][] = hash('sha256', strtolower($countrycode));
			} else {
				$countrycode = $this->getcountrycode($this->config->get('config_country_id'));
				$zonecode = $this->getzonecode($this->config->get('config_zone_id'));
				
				$json['user_data']['fn'][] = hash('sha256', strtolower(utf8_encode('joe')));
				$json['user_data']['ln'][] = hash('sha256', strtolower(utf8_encode('smith')));
				$json['user_data']['em'][] = hash('sha256', strtolower(utf8_encode('joe@gmail.com')));
				$json['user_data']['ph'][] = hash('sha256', strtolower(utf8_encode(substr('6505551234',-10))));
				$json['user_data']['ct'][] = hash('sha256', strtolower(utf8_encode('menlopark')));
				$json['user_data']['zp'][] = hash('sha256', strtolower(utf8_encode('94035')));
				$json['user_data']['st'][] = hash('sha256', strtolower($zonecode));
				$json['user_data']['country'][] = hash('sha256', strtolower($countrycode));
			}
  			
			// API START			
			$url = 'https://graph.facebook.com/v14.0/'.$this->config->get('config_fbcapidyad_pxid').'/events';
			
 			$fields = array();
			$fields['data'] = json_encode(array($json));
			$fields['access_token'] = $this->config->get('config_fbcapidyad_apitok');
			if($this->config->get('config_fbcapidyad_evcd')) { 
				$fields['test_event_code'] = $this->config->get('config_fbcapidyad_evcd');
			} 
  			
			$result = '';
			if(function_exists('curl_version')) { 
				$ch = curl_init();
				curl_setopt_array($ch, array(
				  CURLOPT_URL => $url, 
				  CURLOPT_RETURNTRANSFER => true,
				  CURLOPT_ENCODING => "",
				  CURLOPT_MAXREDIRS => 10,
				  CURLOPT_TIMEOUT => 30,
				  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
				  CURLOPT_CUSTOMREQUEST => "POST",
				  CURLOPT_POSTFIELDS => http_build_query($fields),
				  CURLOPT_HTTPHEADER => array(
					"cache-control: no-cache",
					"Accept: application/json"  
				  ),
				));
 				$result = curl_exec($ch);
				curl_close($ch);
			} else {
				$this->log->write('curl is disbaled');
			}
			
			//$this->log->write($result); $this->log->write($json);
			
			return $result;
		}
	}
	public function getmicrotag($pinfo){
		// pixel dynamic ads
		$adscode = ''; 
		$server = $this->config->get('config_url');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		}
		
		$catname = $this->getcatname($pinfo['product_id']);
		$brand_name = $this->getbrandname($pinfo['product_id']);				
		$stockst = $pinfo['quantity'] > 0 ? 'InStock' : 'OutofStock';
		$price = $this->tax->calculate(($pinfo['special'] ? $pinfo['special'] : $pinfo['price']), $pinfo['tax_class_id'], $this->config->get('config_tax'));
		
		$adscode .= '<div itemscope itemtype="http://schema.org/Product">';
			$adscode .= '<meta itemprop="brand" content="'.$brand_name.'">';
			$adscode .= '<meta itemprop="name" content="'.$pinfo['name'].'">';
			$adscode .= '<meta itemprop="productID" content="'.$pinfo['model'].'">';
			$adscode .= '<meta itemprop="description" content="'.$pinfo['name'].'">';
			$adscode .= '<meta itemprop="url" content="'.$this->url->link('product/product', '&product_id=' . $pinfo['product_id']).'">';
			$adscode .= '<meta itemprop="image" content="'.$server.'image/'.$pinfo['image'].'">';
			$adscode .= '<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">';
				$adscode .= '<link itemprop="availability" href="http://schema.org/'.$stockst.'">';
				$adscode .= '<link itemprop="itemCondition" href="http://schema.org/NewCondition">';
				$adscode .= '<meta itemprop="price" content="'.$this->getcurval($price).'">';
				$adscode .= '<meta itemprop="priceCurrency" content="'.$this->session->data['currency'].'">';
			$adscode .= '</div>';	
		$adscode .= '</div>';
		
		return $adscode;
	}
	public function get_page_url() {
		$url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? "https://" : "http://";		 
		$url.= $_SERVER['HTTP_HOST'];
		$url.= $_SERVER['REQUEST_URI'];
		return $url;
	}
	public function getorderid() {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_status_id > 0 AND ip like '" . $this->db->escape($_SERVER['REMOTE_ADDR']) . "' order by date_added desc limit 1");		
		if($query->num_rows) {
			return $query->row['order_id'];
		}
		return 0;
	}
	public function getProduct($pid) {
		if($pid) { 
			$query = $this->db->query("SELECT DISTINCT *, pd.name, pd.meta_description, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$pid . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
			
			if ($query->num_rows) {
				$query->row['price'] = $query->row['discount'] ? $query->row['discount'] : $query->row['price'];
				return $query->row;
			} else {
				return false;
			}
		}
		return false;
	}
	public function getstorename() {
		$stq = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "store WHERE store_id = '".(int)$this->config->get('config_store_id')."' ");
		return htmlspecialchars_decode(strip_tags(isset($stq->row['name']) ? $stq->row['name'] : $this->config->get('config_name')));
	}
	public function getcatname($product_id) {
		if($product_id) { 
			$query = $this->db->query("SELECT name FROM " . DB_PREFIX . "category_description cd 
			INNER JOIN " . DB_PREFIX . "product_to_category pc ON pc.category_id = cd.category_id 
			WHERE 1 AND pc.product_id = '".$product_id."' AND cd.language_id = '". (int)$this->config->get('config_language_id') ."' limit 1");
			return htmlspecialchars_decode(strip_tags((!empty($query->row['name'])) ? $query->row['name'] : ''));
		} 
		return '';
	}
	public function getbrandname($pid) {
		if($pid) { 
			$query = $this->db->query("SELECT name from " . DB_PREFIX . "manufacturer m INNER JOIN " . DB_PREFIX . "product p on m.manufacturer_id = p.manufacturer_id WHERE 1 AND p.product_id = ".$pid);
			return htmlspecialchars_decode(strip_tags((!empty($query->row['name'])) ? $query->row['name'] : ''));
		}
		return '';
	}
	public function getprorel($pid) {
		$q = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related pr 
		LEFT JOIN " . DB_PREFIX . "product p ON (pr.related_id = p.product_id) 
		LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) 
		WHERE pr.product_id = '" . (int)$pid . "' AND p.status = '1' 
		AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		return $q->rows;
	}
	public function getcategory($category_id) {
		$sql = "SELECT p.product_id FROM " . DB_PREFIX . "product p 
		LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) 
		LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) 
		LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)
		WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
		AND p2c.category_id = '" . (int)$category_id . "'
		AND p.status = '1' AND p.date_available <= NOW() 
		AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
		$sql .= " GROUP BY p.product_id LIMIT 5";
		
		$query = $this->db->query($sql);
			
		return $query->rows;
	}
	public function getsearchrs($srchstr) {
		$filter_data = array('filter_name' => $srchstr, 'start' => 0, 'limit' => 5);
		
		$sql = "SELECT p.product_id FROM " . DB_PREFIX . "product p 
		LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) 
		LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) 
		WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
		AND p.status = '1' AND p.date_available <= NOW() 
		AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
		$data['filter_name'] = $srchstr;
		if (!empty($data['filter_name'])) {
			$sql .= " AND ( pd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
			$sql .= " OR LCASE(p.model) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
			$sql .= " OR LCASE(p.sku) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
			$sql .= " OR LCASE(p.upc) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
			$sql .= " OR LCASE(p.ean) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
			$sql .= " OR LCASE(p.jan) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
			$sql .= " OR LCASE(p.isbn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
			$sql .= " OR LCASE(p.mpn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
			$sql .= ")";
		}
		$sql .= " GROUP BY p.product_id LIMIT 5";
		
		$query = $this->db->query($sql);
			
		return $query->rows;
	}
	public function getorderproduct($order_id) {
 		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "' ");
 		return $query->rows;
	}
	public function getordertax($order_id) {
 		$q = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' AND code = 'tax'");
		if (isset($q->row['value']) && $q->row['value']) {
			return $this->getcurval($q->row['value']);
		} 
		return 0;
	}
	public function getordershipping($order_id) {
 		$q = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' AND code = 'shipping'");
		if (isset($q->row['value']) && $q->row['value']) {
			return $this->getcurval($q->row['value']);
		} 
		return 0;
	}
	public function getcountrycode($cid) {
		$q = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE country_id = '" . (int)$cid . "' ");
		return isset($q->row['iso_code_2']) && trim($q->row['iso_code_2']) != '' ? $q->row['iso_code_2'] : 'US';
	}
	public function getzonecode($zid) {
		$q = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE zone_id = '" . (int)$zid . "' ");
		return isset($q->row['code']) && trim($q->row['code']) != '' ? substr($q->row['code'],0,2) : 'AL';
	}
	public function getcstadr($cid, $addid) {
		$q = $this->db->query("SELECT * FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$cid . "' and address_id = '" . (int)$addid . "' ");
		return $q->row;
	}
	public function getcurval($taxprc) {
		if(substr(VERSION,0,3)>='3.0' || substr(VERSION,0,3)=='2.3' || substr(VERSION,0,3)=='2.2') { 
			$taxprc = $this->currency->format($taxprc, $this->session->data['currency'], false, false);
		} else {
			$taxprc = $this->currency->format($taxprc, '', false, false);
		}	
		return round($taxprc,2);
	}
}