<?php
require_once DIR_SYSTEM . 'jbuygetcombo/ocjbuygetcomboTrait.php';
class ControllerJBuyGetComboJBuyGetCombo extends Controller {
	use ocjbuygetcomboTrait;
	private $error = array();

	public function __construct($registry) {
		parent :: __construct($registry);
		$this->initjbuygetcomboTrait();
		$this->buildJBuyGetComboTables();

		$this->document->addStyle('view/stylesheet/jbuygetcombo/stylesheet.css');
	}

	public function index() {
		$this->load->language('jbuygetcombo/jbuygetcombo');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('jbuygetcombo/jbuygetcombo');

		$this->getList();
	}

	public function add() {
		$this->load->language('jbuygetcombo/jbuygetcombo');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('jbuygetcombo/jbuygetcombo');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_jbuygetcombo_jbuygetcombo->addJBuyGetCombo($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_qty_buy'])) {
				$url .= '&filter_qty_buy=' . urlencode(html_entity_decode($this->request->get['filter_qty_buy'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_qty_get'])) {
				$url .= '&filter_qty_get=' . urlencode(html_entity_decode($this->request->get['filter_qty_get'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_date_start'])) {
				$url .= '&filter_date_start=' . urlencode(html_entity_decode($this->request->get['filter_date_start'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_date_end'])) {
				$url .= '&filter_date_end=' . urlencode(html_entity_decode($this->request->get['filter_date_end'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_buy_category'])) {
				$url .= '&filter_buy_category=' . urlencode(html_entity_decode($this->request->get['filter_buy_category'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_buy_product'])) {
				$url .= '&filter_buy_product=' . urlencode(html_entity_decode($this->request->get['filter_buy_product'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_buy_manufacturer'])) {
				$url .= '&filter_buy_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_buy_manufacturer'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_stores'])) {
				$url .= '&filter_stores=' . urlencode(html_entity_decode($this->request->get['filter_stores'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_sort_order'])) {
				$url .= '&filter_sort_order=' . urlencode(html_entity_decode($this->request->get['filter_sort_order'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_customer_group'])) {
				$url .= '&filter_customer_group=' . urlencode(html_entity_decode($this->request->get['filter_customer_group'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_get_category'])) {
				$url .= '&filter_get_category=' . urlencode(html_entity_decode($this->request->get['filter_get_category'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_get_product'])) {
				$url .= '&filter_get_product=' . urlencode(html_entity_decode($this->request->get['filter_get_product'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_get_manufacturer'])) {
				$url .= '&filter_get_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_get_manufacturer'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_discount'])) {
				$url .= '&filter_discount=' . urlencode(html_entity_decode($this->request->get['filter_discount'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . $url, $this->JocSSL));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('jbuygetcombo/jbuygetcombo');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('jbuygetcombo/jbuygetcombo');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_jbuygetcombo_jbuygetcombo->editJBuyGetCombo($this->request->get['jbuygetcombo_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_qty_buy'])) {
				$url .= '&filter_qty_buy=' . urlencode(html_entity_decode($this->request->get['filter_qty_buy'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_qty_get'])) {
				$url .= '&filter_qty_get=' . urlencode(html_entity_decode($this->request->get['filter_qty_get'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_date_start'])) {
				$url .= '&filter_date_start=' . urlencode(html_entity_decode($this->request->get['filter_date_start'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_date_end'])) {
				$url .= '&filter_date_end=' . urlencode(html_entity_decode($this->request->get['filter_date_end'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_buy_category'])) {
				$url .= '&filter_buy_category=' . urlencode(html_entity_decode($this->request->get['filter_buy_category'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_buy_product'])) {
				$url .= '&filter_buy_product=' . urlencode(html_entity_decode($this->request->get['filter_buy_product'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_buy_manufacturer'])) {
				$url .= '&filter_buy_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_buy_manufacturer'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_stores'])) {
				$url .= '&filter_stores=' . urlencode(html_entity_decode($this->request->get['filter_stores'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_sort_order'])) {
				$url .= '&filter_sort_order=' . urlencode(html_entity_decode($this->request->get['filter_sort_order'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_customer_group'])) {
				$url .= '&filter_customer_group=' . urlencode(html_entity_decode($this->request->get['filter_customer_group'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_get_category'])) {
				$url .= '&filter_get_category=' . urlencode(html_entity_decode($this->request->get['filter_get_category'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_get_product'])) {
				$url .= '&filter_get_product=' . urlencode(html_entity_decode($this->request->get['filter_get_product'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_get_manufacturer'])) {
				$url .= '&filter_get_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_get_manufacturer'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_discount'])) {
				$url .= '&filter_discount=' . urlencode(html_entity_decode($this->request->get['filter_discount'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . $url, $this->JocSSL));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('jbuygetcombo/jbuygetcombo');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('jbuygetcombo/jbuygetcombo');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $jbuygetcombo_id) {
				$this->model_jbuygetcombo_jbuygetcombo->deleteJBuyGetCombo($jbuygetcombo_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_qty_buy'])) {
				$url .= '&filter_qty_buy=' . urlencode(html_entity_decode($this->request->get['filter_qty_buy'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_qty_get'])) {
				$url .= '&filter_qty_get=' . urlencode(html_entity_decode($this->request->get['filter_qty_get'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_date_start'])) {
				$url .= '&filter_date_start=' . urlencode(html_entity_decode($this->request->get['filter_date_start'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_date_end'])) {
				$url .= '&filter_date_end=' . urlencode(html_entity_decode($this->request->get['filter_date_end'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_buy_category'])) {
				$url .= '&filter_buy_category=' . urlencode(html_entity_decode($this->request->get['filter_buy_category'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_buy_product'])) {
				$url .= '&filter_buy_product=' . urlencode(html_entity_decode($this->request->get['filter_buy_product'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_buy_manufacturer'])) {
				$url .= '&filter_buy_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_buy_manufacturer'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_stores'])) {
				$url .= '&filter_stores=' . urlencode(html_entity_decode($this->request->get['filter_stores'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_sort_order'])) {
				$url .= '&filter_sort_order=' . urlencode(html_entity_decode($this->request->get['filter_sort_order'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_customer_group'])) {
				$url .= '&filter_customer_group=' . urlencode(html_entity_decode($this->request->get['filter_customer_group'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_get_category'])) {
				$url .= '&filter_get_category=' . urlencode(html_entity_decode($this->request->get['filter_get_category'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_get_product'])) {
				$url .= '&filter_get_product=' . urlencode(html_entity_decode($this->request->get['filter_get_product'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_get_manufacturer'])) {
				$url .= '&filter_get_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_get_manufacturer'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_discount'])) {
				$url .= '&filter_discount=' . urlencode(html_entity_decode($this->request->get['filter_discount'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . $url, $this->JocSSL));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_qty_buy'])) {
			$filter_qty_buy = $this->request->get['filter_qty_buy'];
		} else {
			$filter_qty_buy = null;
		}

		if (isset($this->request->get['filter_qty_get'])) {
			$filter_qty_get = $this->request->get['filter_qty_get'];
		} else {
			$filter_qty_get = null;
		}

		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = null;
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = null;
		}

		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_buy_category'])) {
			$filter_buy_category = $this->request->get['filter_buy_category'];
		} else {
			$filter_buy_category = null;
		}

		if (isset($this->request->get['filter_buy_product'])) {
			$filter_buy_product = $this->request->get['filter_buy_product'];
		} else {
			$filter_buy_product = null;
		}

		if (isset($this->request->get['filter_buy_manufacturer'])) {
			$filter_buy_manufacturer = $this->request->get['filter_buy_manufacturer'];
		} else {
			$filter_buy_manufacturer = null;
		}

		if (isset($this->request->get['filter_stores'])) {
			$filter_stores = $this->request->get['filter_stores'];
		} else {
			$filter_stores = null;
		}

		if (isset($this->request->get['filter_sort_order'])) {
			$filter_sort_order = $this->request->get['filter_sort_order'];
		} else {
			$filter_sort_order = null;
		}

		if (isset($this->request->get['filter_customer_group'])) {
			$filter_customer_group = $this->request->get['filter_customer_group'];
		} else {
			$filter_customer_group = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['filter_get_category'])) {
			$filter_get_category = $this->request->get['filter_get_category'];
		} else {
			$filter_get_category = null;
		}

		if (isset($this->request->get['filter_get_product'])) {
			$filter_get_product = $this->request->get['filter_get_product'];
		} else {
			$filter_get_product = null;
		}

		if (isset($this->request->get['filter_get_manufacturer'])) {
			$filter_get_manufacturer = $this->request->get['filter_get_manufacturer'];
		} else {
			$filter_get_manufacturer = null;
		}

		if (isset($this->request->get['filter_discount'])) {
			$filter_discount = $this->request->get['filter_discount'];
		} else {
			$filter_discount = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'a.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_qty_buy'])) {
			$url .= '&filter_qty_buy=' . urlencode(html_entity_decode($this->request->get['filter_qty_buy'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_qty_get'])) {
			$url .= '&filter_qty_get=' . urlencode(html_entity_decode($this->request->get['filter_qty_get'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . urlencode(html_entity_decode($this->request->get['filter_date_start'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . urlencode(html_entity_decode($this->request->get['filter_date_end'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_category'])) {
			$url .= '&filter_buy_category=' . urlencode(html_entity_decode($this->request->get['filter_buy_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_product'])) {
			$url .= '&filter_buy_product=' . urlencode(html_entity_decode($this->request->get['filter_buy_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_manufacturer'])) {
			$url .= '&filter_buy_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_buy_manufacturer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_stores'])) {
			$url .= '&filter_stores=' . urlencode(html_entity_decode($this->request->get['filter_stores'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_sort_order'])) {
			$url .= '&filter_sort_order=' . urlencode(html_entity_decode($this->request->get['filter_sort_order'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group'])) {
			$url .= '&filter_customer_group=' . urlencode(html_entity_decode($this->request->get['filter_customer_group'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_get_category'])) {
			$url .= '&filter_get_category=' . urlencode(html_entity_decode($this->request->get['filter_get_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_get_product'])) {
			$url .= '&filter_get_product=' . urlencode(html_entity_decode($this->request->get['filter_get_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_get_manufacturer'])) {
			$url .= '&filter_get_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_get_manufacturer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_discount'])) {
			$url .= '&filter_discount=' . urlencode(html_entity_decode($this->request->get['filter_discount'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $this->JocToken.'=' . $this->session->data[$this->JocToken], $this->JocSSL)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . $url, $this->JocSSL)
		);

		$data['add'] = $this->url->link('jbuygetcombo/jbuygetcombo/add', $this->JocToken.'=' . $this->session->data[$this->JocToken] . $url, $this->JocSSL);
		$data['delete'] = $this->url->link('jbuygetcombo/jbuygetcombo/delete', $this->JocToken.'=' . $this->session->data[$this->JocToken] . $url, $this->JocSSL);

		$data['token'] = $this->session->data[$this->JocToken];
		$data['JocToken'] = $this->JocToken;

		$this->load->model('setting/setting');
		$jbuygetcombo_module_info = $this->model_setting_setting->getSetting('jbuygetcombo');
		$data['columns'] = array();
		if(!empty($jbuygetcombo_module_info['jbuygetcombo_columns'])) {
			$data['columns'] = $jbuygetcombo_module_info['jbuygetcombo_columns'];
		}


		$data['stores'] = $this->getStores();

		$data['customer_groups'] = $this->getCustomerGroups();

		$data['jbuygetcombos'] = array();

		$filter_data = array(
			'filter_qty_buy'  => $filter_qty_buy,
			'filter_qty_get'  => $filter_qty_get,
			'filter_date_start'  => $filter_date_start,
			'filter_date_end'  => $filter_date_end,
			'filter_name'  => $filter_name,
			'filter_buy_category'  => $filter_buy_category,
			'filter_buy_product'  => $filter_buy_product,
			'filter_buy_manufacturer'  => $filter_buy_manufacturer,
			'filter_stores'  => $filter_stores,
			'filter_sort_order'  => $filter_sort_order,
			'filter_customer_group'  => $filter_customer_group,
			'filter_status'  => $filter_status,
			'filter_get_category'  => $filter_get_category,
			'filter_get_product'  => $filter_get_product,
			'filter_get_manufacturer'  => $filter_get_manufacturer,
			'filter_discount'  => $filter_discount,
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$jbuygetcombo_total = $this->model_jbuygetcombo_jbuygetcombo->getTotalJBuyGetCombos($filter_data);

		$results = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetCombos($filter_data);

		$customergroups = array();
		foreach ($data['customer_groups'] as $_customergroup) {
			$customergroups[$_customergroup['customer_group_id']] = $_customergroup;
		}

		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('catalog/manufacturer');

		foreach ($results as $result) {

			$combo_customer_groups = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboCustomerGroups($result['jbuygetcombo_id']);

			$customer_groups = array();

			foreach ($combo_customer_groups as $combo_customer_group_id) {
				if(isset($customergroups[$combo_customer_group_id])) {
					$customer_groups[] = $customergroups[$combo_customer_group_id];
				}
			}


			$stores = array();
			$combo_stores = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboStores($result['jbuygetcombo_id']);

			foreach ($combo_stores as $store_id) {
				if(isset($data['stores'][$store_id])) {
					$stores[] = $data['stores'][$store_id];
				}
			}

			$buy_categories = array();
			$buycategories = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboBuyCategories($result['jbuygetcombo_id']);
			foreach ($buycategories as $buycategory_id) {
				$category_info = $this->model_catalog_category->getCategory($buycategory_id);
				if($category_info) {
					$buy_categories[] = array(
						'category_id' => $category_info['category_id'],
						'name' => $category_info['name'],
					);
				}
			}

			$buy_products = array();
			$buyproducts = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboBuyProducts($result['jbuygetcombo_id']);
			foreach ($buyproducts as $buyproduct_id) {
				$product_info = $this->model_catalog_product->getProduct($buyproduct_id);
				if($product_info) {
					$buy_products[] = array(
						'product_id' => $product_info['product_id'],
						'name' => $product_info['name'],
					);
				}
			}

			$buy_manufacturers = array();
			$buymanufacturers = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboBuyManufacturers($result['jbuygetcombo_id']);
			foreach ($buymanufacturers as $buymanufacturer_id) {
				$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($buymanufacturer_id);
				if($manufacturer_info) {
					$buy_manufacturers[] = array(
						'manufacturer_id' => $manufacturer_info['manufacturer_id'],
						'name' => $manufacturer_info['name'],
					);
				}
			}

			$get_categories = array();
			$getcategories = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboGetCategories($result['jbuygetcombo_id']);

			foreach ($getcategories as $getcategory_id) {
				$category_info = $this->model_catalog_category->getCategory($getcategory_id);

				if($category_info) {
					$get_categories[] = array(
						'category_id' => $category_info['category_id'],
						'name' => ($category_info['path'] ? $category_info['path'] .'&nbsp;&nbsp;&gt;&nbsp;&nbsp;' : '') .$category_info['name'],
					);
				}
			}

			$get_products = array();
			$getproducts = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboGetProducts($result['jbuygetcombo_id']);
			foreach ($getproducts as $getproduct_id) {
				$product_info = $this->model_catalog_product->getProduct($getproduct_id);
				if($product_info) {
					$get_products[] = array(
						'product_id' => $product_info['product_id'],
						'name' => $product_info['name'],
					);
				}
			}

			$get_manufacturers = array();
			$getmanufacturers = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetComboGetManufacturers($result['jbuygetcombo_id']);
			foreach ($getmanufacturers as $getmanufacturer_id) {
				$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($getmanufacturer_id);
				if($manufacturer_info) {
					$get_manufacturers[] = array(
						'manufacturer_id' => $manufacturer_info['manufacturer_id'],
						'name' => $manufacturer_info['name'],
					);
				}
			}


			$data['jbuygetcombos'][] = array(
				'jbuygetcombo_id'    => $result['jbuygetcombo_id'],
				'name'            => $result['name'],
				'discount_type'		=> $result['discount_type'],
				'discount_text'		=> $this->language->get('text_discount_type_'.$result['discount_type']),
				'discount_value'	=> $result['discount_value'],
				'qty_buy'	=> $result['qty_buy'],
				'qty_get'	=> $result['qty_get'],
				'sort_order'	=> $result['sort_order'],
				'buy_categories'	=> $buy_categories,
				'buy_products'	=> $buy_products,
				'buy_manufacturers'	=> $buy_manufacturers,
				'get_categories'	=> $get_categories,
				'get_products'	=> $get_products,
				'get_manufacturers'	=> $get_manufacturers,
				'stores'	=> $stores,
				'customer_groups'	=> $customer_groups,
				'date_start'	=> $result['date_start'] != '' && $result['date_start'] != '0000-00-00' ? $result['date_start'] : '&nbsp;',
				'date_end'	=> $result['date_end'] != '' && $result['date_end'] != '0000-00-00' ? $result['date_end'] : '&nbsp;',
				'status'	=> $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'rstatus'	=> $result['status'],
				'date_added'	=> $result['date_added'] != '0000-00-00 00:00:00' ? date($this->language->get('date_format_short'), strtotime($result['date_added'])) : '&nbsp;',
				'date_modified'	=> $result['date_modified'] != '0000-00-00 00:00:00' ? date($this->language->get('date_format_short'), strtotime($result['date_modified'])) : '&nbsp;',
				'edit'            => $this->url->link('jbuygetcombo/jbuygetcombo/edit', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&jbuygetcombo_id=' . $result['jbuygetcombo_id'] . $url, $this->JocSSL)
			);
		}


		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_free'] = $this->language->get('text_free');
		$data['text_fixed'] = $this->language->get('text_fixed');
		$data['text_percentage'] = $this->language->get('text_percentage');
		$data['text_type'] = $this->language->get('text_type');
		$data['text_value'] = $this->language->get('text_value');
		$data['text_start'] = $this->language->get('text_start');
		$data['text_end'] = $this->language->get('text_end');
		$data['text_added'] = $this->language->get('text_added');
		$data['text_modified'] = $this->language->get('text_modified');
		$data['text_columns_filter'] = $this->language->get('text_columns_filter');
		$data['text_none'] = $this->language->get('text_none');


		$data['column_info'] = $this->language->get('column_info');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_discount'] = $this->language->get('column_discount');
		$data['column_discount_type'] = $this->language->get('column_discount_type');
		$data['column_discount_value'] = $this->language->get('column_discount_value');
		$data['column_qty_buy'] = $this->language->get('column_qty_buy');
		$data['column_qty_get'] = $this->language->get('column_qty_get');
		$data['column_getbuy'] = $this->language->get('column_getbuy');
		$data['column_buy_category'] = $this->language->get('column_buy_category');
		$data['column_buy_product'] = $this->language->get('column_buy_product');
		$data['column_buy_manufacturer'] = $this->language->get('column_buy_manufacturer');
		$data['column_get_category'] = $this->language->get('column_get_category');
		$data['column_get_product'] = $this->language->get('column_get_product');
		$data['column_get_manufacturer'] = $this->language->get('column_get_manufacturer');

		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_store'] = $this->language->get('column_store');
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_date_start'] = $this->language->get('column_date_start');
		$data['column_date_end'] = $this->language->get('column_date_end');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_date_modified'] = $this->language->get('column_date_modified');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');


		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_qty_buy'] = $this->language->get('entry_qty_buy');
		$data['entry_qty_get'] = $this->language->get('entry_qty_get');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_buy_category'] = $this->language->get('entry_buy_category');
		$data['entry_buy_product'] = $this->language->get('entry_buy_product');
		$data['entry_buy_manufacturer'] = $this->language->get('entry_buy_manufacturer');
		$data['entry_get_category'] = $this->language->get('entry_get_category');
		$data['entry_get_product'] = $this->language->get('entry_get_product');
		$data['entry_get_manufacturer'] = $this->language->get('entry_get_manufacturer');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_discount'] = $this->language->get('entry_discount');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_preferences'] = $this->language->get('button_preferences');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_qty_buy'])) {
			$url .= '&filter_qty_buy=' . urlencode(html_entity_decode($this->request->get['filter_qty_buy'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_qty_get'])) {
			$url .= '&filter_qty_get=' . urlencode(html_entity_decode($this->request->get['filter_qty_get'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . urlencode(html_entity_decode($this->request->get['filter_date_start'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . urlencode(html_entity_decode($this->request->get['filter_date_end'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_category'])) {
			$url .= '&filter_buy_category=' . urlencode(html_entity_decode($this->request->get['filter_buy_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_product'])) {
			$url .= '&filter_buy_product=' . urlencode(html_entity_decode($this->request->get['filter_buy_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_manufacturer'])) {
			$url .= '&filter_buy_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_buy_manufacturer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_stores'])) {
			$url .= '&filter_stores=' . urlencode(html_entity_decode($this->request->get['filter_stores'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_sort_order'])) {
			$url .= '&filter_sort_order=' . urlencode(html_entity_decode($this->request->get['filter_sort_order'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group'])) {
			$url .= '&filter_customer_group=' . urlencode(html_entity_decode($this->request->get['filter_customer_group'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_get_category'])) {
			$url .= '&filter_get_category=' . urlencode(html_entity_decode($this->request->get['filter_get_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_get_product'])) {
			$url .= '&filter_get_product=' . urlencode(html_entity_decode($this->request->get['filter_get_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_get_manufacturer'])) {
			$url .= '&filter_get_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_get_manufacturer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_discount'])) {
			$url .= '&filter_discount=' . urlencode(html_entity_decode($this->request->get['filter_discount'], ENT_QUOTES, 'UTF-8'));
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&sort=a.name' . $url, $this->JocSSL);

		$data['sort_discount'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&sort=a.discount_type' . $url, $this->JocSSL);

		$data['sort_qty_buy'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&sort=a.qty_buy' . $url, $this->JocSSL);

		$data['sort_qty_get'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&sort=a.qty_get' . $url, $this->JocSSL);

		$data['sort_sort_order'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&sort=a.sort_order' . $url, $this->JocSSL);

		$data['sort_status'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&sort=a.status' . $url, $this->JocSSL);

		$data['sort_date_start'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&sort=a.date_start' . $url, $this->JocSSL);

		$data['sort_date_end'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&sort=a.date_end' . $url, $this->JocSSL);

		$data['sort_date_added'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&sort=a.date_added' . $url, $this->JocSSL);

		$data['sort_date_modified'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&sort=a.date_modified' . $url, $this->JocSSL);

		$url = '';

		if (isset($this->request->get['filter_qty_buy'])) {
			$url .= '&filter_qty_buy=' . urlencode(html_entity_decode($this->request->get['filter_qty_buy'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_qty_get'])) {
			$url .= '&filter_qty_get=' . urlencode(html_entity_decode($this->request->get['filter_qty_get'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . urlencode(html_entity_decode($this->request->get['filter_date_start'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . urlencode(html_entity_decode($this->request->get['filter_date_end'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_category'])) {
			$url .= '&filter_buy_category=' . urlencode(html_entity_decode($this->request->get['filter_buy_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_product'])) {
			$url .= '&filter_buy_product=' . urlencode(html_entity_decode($this->request->get['filter_buy_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_manufacturer'])) {
			$url .= '&filter_buy_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_buy_manufacturer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_stores'])) {
			$url .= '&filter_stores=' . urlencode(html_entity_decode($this->request->get['filter_stores'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_sort_order'])) {
			$url .= '&filter_sort_order=' . urlencode(html_entity_decode($this->request->get['filter_sort_order'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group'])) {
			$url .= '&filter_customer_group=' . urlencode(html_entity_decode($this->request->get['filter_customer_group'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_get_category'])) {
			$url .= '&filter_get_category=' . urlencode(html_entity_decode($this->request->get['filter_get_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_get_product'])) {
			$url .= '&filter_get_product=' . urlencode(html_entity_decode($this->request->get['filter_get_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_get_manufacturer'])) {
			$url .= '&filter_get_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_get_manufacturer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_discount'])) {
			$url .= '&filter_discount=' . urlencode(html_entity_decode($this->request->get['filter_discount'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $jbuygetcombo_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . $url . '&page={page}', $this->JocSSL);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($jbuygetcombo_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($jbuygetcombo_total - $this->config->get('config_limit_admin'))) ? $jbuygetcombo_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $jbuygetcombo_total, ceil($jbuygetcombo_total / $this->config->get('config_limit_admin')));

		$data['filter_qty_buy'] = $filter_qty_buy;
		$data['filter_qty_get'] = $filter_qty_get;
		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;
		$data['filter_name'] = $filter_name;
		$data['filter_buy_category'] = $filter_buy_category;
		$data['filter_buy_product'] = $filter_buy_product;
		$data['filter_buy_manufacturer'] = $filter_buy_manufacturer;
		$data['filter_stores'] = $filter_stores;
		$data['filter_sort_order'] = $filter_sort_order;
		$data['filter_customer_group'] = $filter_customer_group;
		$data['filter_status'] = $filter_status;
		$data['filter_get_category'] = $filter_get_category;
		$data['filter_get_product'] = $filter_get_product;
		$data['filter_get_manufacturer'] = $filter_get_manufacturer;
		$data['filter_discount'] = $filter_discount;
		$data['sort'] = $sort;
		$data['order'] = $order;


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->loadView('jbuygetcombo/jbuygetcombo_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['jbuygetcombo_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$data['text_free'] = $this->language->get('text_free');
		$data['text_fixed'] = $this->language->get('text_fixed');
		$data['text_percentage'] = $this->language->get('text_percentage');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_selectall'] = $this->language->get('text_selectall');
		$data['text_deselectall'] = $this->language->get('text_deselectall');
		$data['text_tab_description_above'] = $this->language->get('text_tab_description_above');
		$data['text_tab_description_inside'] = $this->language->get('text_tab_description_inside');
		$data['text_as_popup'] = $this->language->get('text_as_popup');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_discount'] = $this->language->get('entry_discount');
		$data['entry_discount_value'] = $this->language->get('entry_discount_value');
		$data['entry_qty_buy'] = $this->language->get('entry_qty_buy');
		$data['entry_qty_get'] = $this->language->get('entry_qty_get');
		$data['entry_text_ribbon'] = $this->language->get('entry_text_ribbon');
		$data['entry_text_order_total'] = $this->language->get('entry_text_order_total');
		$data['entry_text_popup_btn'] = $this->language->get('entry_text_popup_btn');
		$data['entry_text_popup_btn_close'] = $this->language->get('entry_text_popup_btn_close');
		$data['entry_text_tab'] = $this->language->get('entry_text_tab');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_buy_category'] = $this->language->get('entry_buy_category');
		$data['entry_buy_product'] = $this->language->get('entry_buy_product');
		$data['entry_buy_manufacturer'] = $this->language->get('entry_buy_manufacturer');
		$data['entry_get_category'] = $this->language->get('entry_get_category');
		$data['entry_get_product'] = $this->language->get('entry_get_product');
		$data['entry_get_manufacturer'] = $this->language->get('entry_get_manufacturer');
		$data['entry_buyget_position'] = $this->language->get('entry_buyget_position');
		$data['entry_combo_title'] = $this->language->get('entry_combo_title');
		$data['entry_combo_description'] = $this->language->get('entry_combo_description');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_getbuy'] = $this->language->get('tab_getbuy');
		$data['tab_description'] = $this->language->get('tab_description');

		$data['legend_buy'] = $this->language->get('legend_buy');
		$data['legend_get'] = $this->language->get('legend_get');
		$data['legend_description'] = $this->language->get('legend_description');

		$data['help_category'] = $this->language->get('help_category');
		$data['help_product'] = $this->language->get('help_product');
		$data['help_manufacturer'] = $this->language->get('help_manufacturer');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['discount_value'])) {
			$data['error_discount_value'] = $this->error['discount_value'];
		} else {
			$data['error_discount_value'] = '';
		}

		if (isset($this->error['qty_buy'])) {
			$data['error_qty_buy'] = $this->error['qty_buy'];
		} else {
			$data['error_qty_buy'] = '';
		}

		if (isset($this->error['qty_get'])) {
			$data['error_qty_get'] = $this->error['qty_get'];
		} else {
			$data['error_qty_get'] = '';
		}

		if (isset($this->error['date_start'])) {
			$data['error_date_start'] = $this->error['date_start'];
		} else {
			$data['error_date_start'] = '';
		}

		if (isset($this->error['date_end'])) {
			$data['error_date_end'] = $this->error['date_end'];
		} else {
			$data['error_date_end'] = '';
		}

		if (isset($this->error['store'])) {
			$data['error_store'] = $this->error['store'];
		} else {
			$data['error_store'] = '';
		}

		if (isset($this->error['customer_group'])) {
			$data['error_customer_group'] = $this->error['customer_group'];
		} else {
			$data['error_customer_group'] = '';
		}

		if (isset($this->error['buy_item'])) {
			$data['error_buy_item'] = $this->error['buy_item'];
		} else {
			$data['error_buy_item'] = '';
		}

		if (isset($this->error['get_item'])) {
			$data['error_get_item'] = $this->error['get_item'];
		} else {
			$data['error_get_item'] = '';
		}

		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_qty_buy'])) {
			$url .= '&filter_qty_buy=' . urlencode(html_entity_decode($this->request->get['filter_qty_buy'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_qty_get'])) {
			$url .= '&filter_qty_get=' . urlencode(html_entity_decode($this->request->get['filter_qty_get'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . urlencode(html_entity_decode($this->request->get['filter_date_start'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . urlencode(html_entity_decode($this->request->get['filter_date_end'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_category'])) {
			$url .= '&filter_buy_category=' . urlencode(html_entity_decode($this->request->get['filter_buy_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_product'])) {
			$url .= '&filter_buy_product=' . urlencode(html_entity_decode($this->request->get['filter_buy_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_buy_manufacturer'])) {
			$url .= '&filter_buy_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_buy_manufacturer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_stores'])) {
			$url .= '&filter_stores=' . urlencode(html_entity_decode($this->request->get['filter_stores'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_sort_order'])) {
			$url .= '&filter_sort_order=' . urlencode(html_entity_decode($this->request->get['filter_sort_order'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group'])) {
			$url .= '&filter_customer_group=' . urlencode(html_entity_decode($this->request->get['filter_customer_group'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_get_category'])) {
			$url .= '&filter_get_category=' . urlencode(html_entity_decode($this->request->get['filter_get_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_get_product'])) {
			$url .= '&filter_get_product=' . urlencode(html_entity_decode($this->request->get['filter_get_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_get_manufacturer'])) {
			$url .= '&filter_get_manufacturer=' . urlencode(html_entity_decode($this->request->get['filter_get_manufacturer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_discount'])) {
			$url .= '&filter_discount=' . urlencode(html_entity_decode($this->request->get['filter_discount'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $this->JocToken.'=' . $this->session->data[$this->JocToken], $this->JocSSL)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . $url, $this->JocSSL)
		);

		if (!isset($this->request->get['jbuygetcombo_id'])) {
			$data['action'] = $this->url->link('jbuygetcombo/jbuygetcombo/add', $this->JocToken.'=' . $this->session->data[$this->JocToken] . $url, $this->JocSSL);
		} else {
			$data['action'] = $this->url->link('jbuygetcombo/jbuygetcombo/edit', $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&jbuygetcombo_id=' . $this->request->get['jbuygetcombo_id'] . $url, $this->JocSSL);
		}

		$data['cancel'] = $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken] . $url, $this->JocSSL);

		$data['token'] = $this->session->data[$this->JocToken];
		$data['JocToken'] = $this->JocToken;


		if (isset($this->request->get['jbuygetcombo_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$jbuygetcombo_info = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetCombo($this->request->get['jbuygetcombo_id']);
		}

		$data['languages'] = $this->getLanguages();

		$data['stores'] = $this->getStores();

		$data['customer_groups'] = $this->getCustomerGroups();


		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (isset($jbuygetcombo_info['name'])) {
			$data['name'] = $jbuygetcombo_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($jbuygetcombo_info['sort_order'])) {
			$data['sort_order'] = $jbuygetcombo_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		if (isset($this->request->post['discount_type'])) {
			$data['discount_type'] = $this->request->post['discount_type'];
		} elseif (isset($jbuygetcombo_info['discount_type'])) {
			$data['discount_type'] = $jbuygetcombo_info['discount_type'];
		} else {
			$data['discount_type'] = 'fixed';
		}

		if (isset($this->request->post['discount_value'])) {
			$data['discount_value'] = $this->request->post['discount_value'];
		} elseif (isset($jbuygetcombo_info['discount_value'])) {
			$data['discount_value'] = $jbuygetcombo_info['discount_value'];
		} else {
			$data['discount_value'] = '';
		}

		if (isset($this->request->post['qty_buy'])) {
			$data['qty_buy'] = $this->request->post['qty_buy'];
		} elseif (isset($jbuygetcombo_info['qty_buy'])) {
			$data['qty_buy'] = $jbuygetcombo_info['qty_buy'];
		} else {
			$data['qty_buy'] = '';
		}
		if (isset($this->request->post['qty_get'])) {
			$data['qty_get'] = $this->request->post['qty_get'];
		} elseif (isset($jbuygetcombo_info['qty_get'])) {
			$data['qty_get'] = $jbuygetcombo_info['qty_get'];
		} else {
			$data['qty_get'] = '';
		}

		if (isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
		} elseif (isset($jbuygetcombo_info['description'])) {
			$data['description'] = $jbuygetcombo_info['description'];
		} else {
			$data['description'] = array();
		}

		if (isset($this->request->post['date_start'])) {
			$data['date_start'] = $this->request->post['date_start'];
		} elseif (isset($jbuygetcombo_info['date_start'])) {
			$data['date_start'] = ($jbuygetcombo_info['date_start'] != '0000-00-00') ? $jbuygetcombo_info['date_start'] : '' ;
		} else {
			$data['date_start'] = '';
		}

		if (isset($this->request->post['date_end'])) {
			$data['date_end'] = $this->request->post['date_end'];
		} elseif (isset($jbuygetcombo_info['date_end'])) {
			$data['date_end'] = ($jbuygetcombo_info['date_end'] != '0000-00-00') ? $jbuygetcombo_info['date_end'] : '';
		} else {
			$data['date_end'] = '';
		}

		if (isset($this->request->post['store'])) {
			$data['store'] = $this->request->post['store'];
		} elseif (isset($jbuygetcombo_info['store'])) {
			$data['store'] = $jbuygetcombo_info['store'];
		} else {
			$data['store'] = array();
		}

		if (isset($this->request->post['customer_group'])) {
			$data['customer_group'] = $this->request->post['customer_group'];
		} elseif (isset($jbuygetcombo_info['customer_group'])) {
			$data['customer_group'] = $jbuygetcombo_info['customer_group'];
		} else {
			$data['customer_group'] = array();
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($jbuygetcombo_info['status'])) {
			$data['status'] = $jbuygetcombo_info['status'];
		} else {
			$data['status'] = 0;
		}

		// Buy
		if (isset($this->request->post['buy_category'])) {
			$buy_category = $this->request->post['buy_category'];
		} elseif (isset($jbuygetcombo_info['buy_category'])) {
			$buy_category = $jbuygetcombo_info['buy_category'];
		} else {
			$buy_category = array();
		}

		$data['buy_categories'] = array();
		$this->load->model('catalog/category');
		foreach ($buy_category as $category_id) {
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$data['buy_categories'][] = array(
					'category_id' => $category_info['category_id'],
					'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
				);
			}
		}

		if (isset($this->request->post['buy_product'])) {
			$buy_product = $this->request->post['buy_product'];
		} elseif (isset($jbuygetcombo_info['buy_product'])) {
			$buy_product = $jbuygetcombo_info['buy_product'];
		} else {
			$buy_product = array();
		}

		$data['buy_products'] = array();
		$this->load->model('catalog/product');
		foreach ($buy_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$data['buy_products'][] = array(
					'product_id' => $product_info['product_id'],
					'name'        => $product_info['name']
				);
			}
		}

		if (isset($this->request->post['buy_manufacturer'])) {
			$buy_manufacturer = $this->request->post['buy_manufacturer'];
		} elseif (isset($jbuygetcombo_info['buy_manufacturer'])) {
			$buy_manufacturer = $jbuygetcombo_info['buy_manufacturer'];
		} else {
			$buy_manufacturer = array();
		}

		$data['buy_manufacturers'] = array();
		$this->load->model('catalog/manufacturer');
		foreach ($buy_manufacturer as $manufacturer_id) {
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);

			if ($manufacturer_info) {
				$data['buy_manufacturers'][] = array(
					'manufacturer_id' => $manufacturer_info['manufacturer_id'],
					'name'        => $manufacturer_info['name']
				);
			}
		}

		// Get
		if (isset($this->request->post['get_category'])) {
			$jbuygetcombo_get_category = $this->request->post['get_category'];
		} elseif (isset($jbuygetcombo_info['get_category'])) {
			$jbuygetcombo_get_category = $jbuygetcombo_info['get_category'];
		} else {
			$jbuygetcombo_get_category = array();
		}

		$data['get_categories'] = array();
		$this->load->model('catalog/category');
		foreach ($jbuygetcombo_get_category as $category_id) {
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$data['get_categories'][] = array(
					'category_id' => $category_info['category_id'],
					'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
				);
			}
		}

		if (isset($this->request->post['get_product'])) {
			$jbuygetcombo_get_product = $this->request->post['get_product'];
		} elseif (isset($jbuygetcombo_info['get_product'])) {
			$jbuygetcombo_get_product = $jbuygetcombo_info['get_product'];
		} else {
			$jbuygetcombo_get_product = array();
		}

		$data['get_products'] = array();
		$this->load->model('catalog/product');
		foreach ($jbuygetcombo_get_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$data['get_products'][] = array(
					'product_id' => $product_info['product_id'],
					'name'        => $product_info['name']
				);
			}
		}

		if (isset($this->request->post['get_manufacturer'])) {
			$jbuygetcombo_get_manufacturer = $this->request->post['get_manufacturer'];
		} elseif (isset($jbuygetcombo_info['get_manufacturer'])) {
			$jbuygetcombo_get_manufacturer = $jbuygetcombo_info['get_manufacturer'];
		} else {
			$jbuygetcombo_get_manufacturer = array();
		}

		$data['get_manufacturers'] = array();
		$this->load->model('catalog/manufacturer');
		foreach ($jbuygetcombo_get_manufacturer as $manufacturer_id) {
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);

			if ($manufacturer_info) {
				$data['get_manufacturers'][] = array(
					'manufacturer_id' => $manufacturer_info['manufacturer_id'],
					'name'        => $manufacturer_info['name']
				);
			}
		}

		if (isset($this->request->post['position'])) {
			$data['position'] = $this->request->post['position'];
		} elseif (isset($jbuygetcombo_info['position'])) {
			$data['position'] = $jbuygetcombo_info['position'];
		} else {
			$data['position'] = 'tab_description_inside';
		}

		$data['summernote'] = $this->var_summernote();
		$data['summernote_editor'] = $this->load->controller('jbuygetcombo/jbuygetcombo_global/summernote_editor');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->loadView('jbuygetcombo/jbuygetcombo_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'jbuygetcombo/jbuygetcombo')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}


		if($this->request->post['discount_type'] != 'free') {
			if (!(float)$this->request->post['discount_value']) {
				$this->error['discount_value'] = $this->language->get('error_discount_value');
			}
		}

		if (!(int)$this->request->post['qty_buy']) {
			$this->error['qty_buy'] = $this->language->get('error_qty_buy');
		}
		if (!(int)$this->request->post['qty_get']) {
			$this->error['qty_get'] = $this->language->get('error_qty_get');
		}
		if (empty($this->request->post['date_start']) || (!empty($this->request->post['date_start']) && $this->request->post['date_start']=='0000-00-00') ) {
			$this->error['date_start'] = $this->language->get('error_date_start');
		}
		/*if (empty($this->request->post['date_end']) || (!empty($this->request->post['date_end']) && $this->request->post['date_end']=='0000-00-00') ) {
			$this->error['date_end'] = $this->language->get('error_date_end');
		}*/
		if (!isset($this->request->post['customer_group'])) {
			$this->error['customer_group'] = $this->language->get('error_customer_group');
		}
		if (!isset($this->request->post['store'])) {
			$this->error['store'] = $this->language->get('error_store');
		}
		if (!isset($this->request->post['buy_category']) && !isset($this->request->post['buy_product']) && !isset($this->request->post['buy_manufacturer'])) {
			$this->error['buy_item'] = $this->language->get('error_buy_item');
		}
		if (!isset($this->request->post['get_category']) && !isset($this->request->post['get_product']) && !isset($this->request->post['get_manufacturer'])) {
			$this->error['get_item'] = $this->language->get('error_get_item');
		}
		foreach ($this->request->post['description'] as $language_id => $value) {
			if ((utf8_strlen($value['text_ribbon']) < 3) || (utf8_strlen($value['text_ribbon']) > 64)) {
				$this->error['description'][$language_id]['text_ribbon'] = $this->language->get('error_text_ribbon');
			}
			if ((utf8_strlen($value['text_order_total']) < 3) || (utf8_strlen($value['text_order_total']) > 64)) {
				$this->error['description'][$language_id]['text_order_total'] = $this->language->get('error_text_order_total');
			}
			if ((utf8_strlen($value['combo_title']) < 3) || (utf8_strlen($value['combo_title']) > 64)) {
				$this->error['description'][$language_id]['combo_title'] = $this->language->get('error_combo_title');
			}

			if($this->request->post['position'] == 'as_popup') {
				if ((utf8_strlen($value['text_popup_btn']) < 3) || (utf8_strlen($value['text_popup_btn']) > 64)) {
					$this->error['description'][$language_id]['text_popup_btn'] = $this->language->get('error_text_popup_btn');
				}
				if ((utf8_strlen($value['text_popup_btn_close']) < 3) || (utf8_strlen($value['text_popup_btn_close']) > 64)) {
					$this->error['description'][$language_id]['text_popup_btn_close'] = $this->language->get('error_text_popup_btn_close');
				}
			}

			if($this->request->post['position'] == 'tab_description_inside') {
				if ((utf8_strlen($value['text_tab']) < 3) || (utf8_strlen($value['text_tab']) > 64)) {
					$this->error['description'][$language_id]['text_tab'] = $this->language->get('error_text_tab');
				}
			}
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'jbuygetcombo/jbuygetcombo')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}

	public function showHideColumnPreferences() {
		$json = array();
		$this->load->language('jbuygetcombo/jbuygetcombo');
		$this->load->model('setting/setting');

		if(isset($this->request->post['columns']) || empty($this->request->post)) {
			$this->request->post['jbuygetcombo_columns'] = isset($this->request->post['columns']) ? $this->request->post['columns'] : array();
			$this->model_setting_setting->editSetting('jbuygetcombo', $this->request->post);
			$json['success'] = $this->language->get('text_preferences_success');
			$json['update'] = 1;
		} else {
			$json['error'] = $this->language->get('text_preferences_error');
			$json['update'] = 0;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('jbuygetcombo/jbuygetcombo');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_jbuygetcombo_jbuygetcombo->getJBuyGetCombos($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'jbuygetcombo_id'    => $result['jbuygetcombo_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'jbuygetcombo_group' => $result['jbuygetcombo_group']
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
