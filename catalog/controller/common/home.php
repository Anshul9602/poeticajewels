<?php
class ControllerCommonHome extends Controller
{
    public function index()
	{
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		// Loading Banners

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner(9);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $result['image']
				);
			}
		}

		$data['banners2'] = array();

		$results = $this->model_design_banner->getBanner(11);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners2'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $result['image']
				);
			}
		}


		//about 
		$data['home_about'] = array();

		$results = $this->model_design_banner->getBanner(10);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['home_about'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $result['image']
				);
			}
		}


		// Home New Collections

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['new_collections'] = array();

		$courses_and_workshops = $this->model_catalog_category->getCategories(59);

		foreach ($courses_and_workshops as $course) {

			$data['new_collections'][] = $course;
		}


		// Most Loved

		$data['most_loved'] = array();

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$filter_data = array(
			'filter_category_id' => '81',
			'start' => '0',
			'limit' => '20'
		);

		$results = $this->model_catalog_product->getProducts($filter_data);


		foreach ($results as $result) {
			if ($result['image']) {
				$image = $result['image'];
			} else {
				$image = $result['image']; // $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
			}

			$pid = $result['product_id'];

			$results_img = $this->model_catalog_product->getProductImages($pid);
			if (empty($results_img)) {
				$images = '';
			}
			$first = true;

			foreach ($results_img as $result_img) {
				if ($first) {
					$images = $this->model_tool_image->resize($result_img['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					$first = false;
				}
			}


			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$special = false;
			}

			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
			} else {
				$tax = false;
			}

			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}

			$data['most_loved'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
				'rating'      => $result['rating'],
				'href'        => $this->url->link('product/product' . '&product_id=' . $result['product_id']),
				'popup' => $images,
				'upc' => $result['upc'],
				'ean' => $result['ean'],
				'jan' => $result['jan'],
				'isbn' => $result['isbn'],
				'mpn' => $result['mpn'],
			);
		}





		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
