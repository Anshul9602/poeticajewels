<?php
require_once DIR_SYSTEM . 'jbuygetcombo/ocjbuygetcomboTrait.php';
class ControllerExtensionTotalJBuyGetCombo extends Controller {
	use ocjbuygetcomboTrait;
	private $error = array();

	public function __construct($registry) {
		parent :: __construct($registry);
		$this->initjbuygetcomboTrait();
		$this->buildJBuyGetComboTables();
	}

	public function index() {
		$this->load->language('extension/total/jbuygetcombo');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_setting_setting->editSetting('total_jbuygetcombo', $this->request->post);

			$this->model_setting_setting->editSetting('jbuygetcombo', array(
				'jbuygetcombo_status' => $this->request->post['total_jbuygetcombo_status'],
				'jbuygetcombo_sort_order' => $this->request->post['total_jbuygetcombo_sort_order'],
			));

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link($this->JExtensionPagePath, $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&type=total', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $this->JocToken.'=' . $this->session->data[$this->JocToken], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link($this->JExtensionPagePath, $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&type=total', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/total/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken], true)
		);

		$data['action'] = $this->url->link('extension/total/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken], true);

		$data['cancel'] = $this->url->link($this->JExtensionPagePath, $this->JocToken.'=' . $this->session->data[$this->JocToken] . '&type=total', true);

		if (isset($this->request->post['total_jbuygetcombo_status'])) {
			$data['total_jbuygetcombo_status'] = $this->request->post['total_jbuygetcombo_status'];
		} else {
			$data['total_jbuygetcombo_status'] = $this->config->get('total_jbuygetcombo_status');
		}

		if (isset($this->request->post['total_jbuygetcombo_sort_order'])) {
			$data['total_jbuygetcombo_sort_order'] = $this->request->post['total_jbuygetcombo_sort_order'];
		} else {
			$data['total_jbuygetcombo_sort_order'] = $this->config->get('total_jbuygetcombo_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->loadView('extension/total/jbuygetcombo', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/total/jbuygetcombo')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}