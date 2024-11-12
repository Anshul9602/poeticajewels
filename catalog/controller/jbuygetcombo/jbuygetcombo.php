<?php
class ControllerJBuyGetComboJBuyGetCombo extends Controller {
	public function index($info = array()) {
		$this->load->language('jbuygetcombo/jbuygetcombo');
		$this->load->model('jbuygetcombo/jbuygetcombo');
		$this->load->model('catalog/product');

		$data['text_tab_jbuygetcombo'] = $this->language->get('text_tab_jbuygetcombo');
		$data['button_jbuygetcombo'] = $this->language->get('button_jbuygetcombo');
		$data['button_jbuygetcombo_gotit'] = $this->language->get('button_jbuygetcombo_gotit');

		$data['jbuygetcombo_info'] = $this->getCombo($this->request->get['product_id'], (!empty($info['product_info']) ? $info['product_info'] : array()) );

		if($data['jbuygetcombo_info']) {
			if(!empty($data['jbuygetcombo_info']['text_tab'])) {
				$data['text_tab_jbuygetcombo'] = $data['jbuygetcombo_info']['text_tab'];
			}
			if(!empty($data['jbuygetcombo_info']['text_popup_btn'])) {
				$data['button_jbuygetcombo'] = $data['jbuygetcombo_info']['text_popup_btn'];
			}

			if(!empty($data['jbuygetcombo_info']['text_popup_btn_close'])) {
				$data['button_jbuygetcombo_gotit'] = $data['jbuygetcombo_info']['text_popup_btn_close'];
			}

			$data['jbuygetcombo_info']['ocombo_description'] = 			$data['jbuygetcombo_info']['combo_description'];

			$data['jbuygetcombo_info']['combo_description'] = html_entity_decode($data['jbuygetcombo_info']['combo_description'], ENT_QUOTES, 'UTF-8');

		}
		return $data;
	}

	public function listing($info = array()) {
		$this->load->language('jbuygetcombo/jbuygetcombo');
		$this->load->model('jbuygetcombo/jbuygetcombo');
		$this->load->model('catalog/product');

		$data = array();
		if(!empty($info['product_id'])) {
			$data['jbuygetcombo_info'] = $this->getCombo($info['product_id'], (!empty($info['product_info']) ? $info['product_info'] : array()) );

		}
		return $data;
	}

	private function getCombo($product_id, $product_info=array()) {
		if(empty($product_info)) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
		}

		$jbuygetcombo_id = 0;
		$find_in = '';
		$find_id = '';
		$jbuygetcombo_info = array();

		if($product_info) {
			$product_categories = $this->model_catalog_product->getCategories($product_id);

			$results =  $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetCombos();

			foreach ($results as $result) {

				$result['buy_products'] = $buy_products = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboBuyProducts($result['jbuygetcombo_id']);
				$result['get_products'] = $get_products = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboGetProducts($result['jbuygetcombo_id']);

				$result['buy_categories'] = $buy_categories = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboBuyCategories($result['jbuygetcombo_id']);
				$result['get_categories'] = $get_categories = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboGetCategories($result['jbuygetcombo_id']);

				$result['buy_manufacturers'] = $buy_manufacturers = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboBuyManufacturers($result['jbuygetcombo_id']);
				$result['get_manufacturers'] = $get_manufacturers = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboGetManufacturers($result['jbuygetcombo_id']);

				// here first we check if any combo has current product direct in buy or get, if found then pick the combo and discard others

				if(in_array($product_id, $buy_products)) {
					$jbuygetcombo_id = $result['jbuygetcombo_id'];
					$result['find_in'] = $find_in = 'buy_products';
					$result['find_id'] = $find_id = $product_id;

					$jbuygetcombo_info = $result;
					break;
				}
				if(in_array($product_id, $get_products)) {
					$jbuygetcombo_id = $result['jbuygetcombo_id'];
					$result['find_in'] = $find_in = 'get_products';
					$result['find_id'] = $find_id = $product_id;
					$jbuygetcombo_info = $result;
					break;
				}

				if($jbuygetcombo_id) {
					break;
				}

				// here we check if any combo category products match with current product in buy category or get category, if found then pick the combo and discard others

				foreach ($product_categories as $product_category) {

					if(in_array($product_category['category_id'], $buy_categories)) {
						$jbuygetcombo_id = $result['jbuygetcombo_id'];
						$result['find_in'] = $find_in = 'buy_categories';
						$result['find_id'] = $find_id = $product_category['category_id'];
						$jbuygetcombo_info = $result;
						break;
					}
					if(in_array($product_category['category_id'], $get_categories)) {
						$jbuygetcombo_id = $result['jbuygetcombo_id'];
						$result['find_in'] = $find_in = 'get_categories';
						$result['find_id'] = $find_id = $product_category['category_id'];
						$jbuygetcombo_info = $result;
						break;
					}

				}

				if($jbuygetcombo_id) {
					break;
				}

				// here we check if any combo manufactuer products match with current product in buy manufacturer or get manufacturer, if found then pick the combo and discard others

				if(in_array($product_info['manufacturer_id'], $buy_manufacturers)) {
					$jbuygetcombo_id = $result['jbuygetcombo_id'];
					$result['find_in'] = $find_in = 'buy_manufacturers';
					$result['find_id'] = $find_id = $product_info['manufacturer_id'];
					$jbuygetcombo_info = $result;
					break;
				}
				if(in_array($product_info['manufacturer_id'], $get_manufacturers)) {
					$jbuygetcombo_id = $result['jbuygetcombo_id'];
					$result['find_in'] = $find_in = 'get_manufacturers';
					$result['find_id'] = $find_id = $product_info['manufacturer_id'];
					$jbuygetcombo_info = $result;
					break;
				}

				if($jbuygetcombo_id) {
					break;
				}
			}

		}
		return $jbuygetcombo_info;
	}

}
