<?php
require_once DIR_SYSTEM . 'jbuygetcombo/ocjbuygetcomboTrait.php';
class ControllerJBuyGetComboJBuyGetComboGlobal extends Controller {
	use ocjbuygetcomboTrait;

	public function __construct($registry) {
		parent :: __construct($registry);
		$this->initjbuygetcomboTrait();
		$this->buildJBuyGetComboTables();
	}
	public function adminMenu() {
		$menus = array();
		if ($this->user->hasPermission('access', 'jbuygetcombo/jbuygetcombo')) {
			$this->load->language('jbuygetcombo/admin_menu');
			$menus = array(
				'id'       => 'menu-jbuygetcombo',
				'icon'	   => 'fa-bars fw',
				'name'	   => $this->language->get('text_jbuygetcombo'),
				'href'     => $this->url->link('jbuygetcombo/jbuygetcombo', $this->JocToken.'=' . $this->session->data[$this->JocToken], true),
				'children' => array()
			);
		}
		return $menus;
	}

	public function summernote_editor($data=array()) {
		return $this->loadView('jbuygetcombo/jbuygetcombo_editor', $data);
	}
}
