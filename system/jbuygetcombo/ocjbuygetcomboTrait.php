<?php

trait ocjbuygetcomboTrait {

	private $JocToken = 'token';
	private $JocSSL = true;
	private $JExtensionPagePath = 'extension/extension';
	public function initjbuygetcomboTrait() {
		if(VERSION < '2.2.0.0') {
			$this->JocSSL = 'ssl';
		}

		if(VERSION >= '3.0.0.0') {
			$this->JocToken = 'user_token';
			$this->JExtensionPagePath = 'marketplace/extension';
		}
	}

	public function var_summernote() {
		$summernote = '';
		return $summernote;
	}

	public function getStores() {
		$this->load->model('setting/store');
		$stores_ = $this->model_setting_store->getStores();

		$stores = array();
		$stores['0'] = array(
			'name' => $this->language->get('text_default'),
			'store_id' => '0',
			'url' => HTTP_CATALOG,
			'ssl' => HTTPS_CATALOG
		);
		foreach ($stores_ as $store) {
			$stores[$store['store_id']] = $store;
		}
		return $stores;
	}

	public function getCustomerGroups() {
		$this->load->model('customer/customer_group');
		return $this->model_customer_customer_group->getCustomerGroups();
	}

	public function getLanguages() {
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();

		if(VERSION >= '2.2.0.0') {
			foreach ($languages as &$language) {
				$language['lang_flag'] = 'language/'.$language['code'].'/'.$language['code'].'.png';
			}
		} else {
			foreach ($languages as &$language) {
				$language['lang_flag'] = 'view/image/flags/'.$language['image'].'';
			}
		}
		return $languages;
	}

	public function loadView($path, &$data) {
		if(VERSION >= '3.0.0.0') {
			$old_template = $this->config->get('template_engine');
			$this->config->set('template_engine', 'template');
		}
		$view = $this->load->view($this->viewPath($path), $data);
		if(VERSION >= '3.0.0.0') {
			$this->config->set('template_engine', $old_template);
		}
		return $view;
	}

	public function viewPath($path) {
		$path_info = pathinfo($path);

		$npath = $path_info['dirname'] . '/'. $path_info['filename'];
		if(VERSION <= '2.3.0.2') {
			$npath.= '.tpl';
		}
		return $npath;
	}

	public function buildJBuyGetComboTables() {

		/* -- Table structure for table `oc_jbuygetcombo` */
		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."jbuygetcombo` (
		  `jbuygetcombo_id` int(11) NOT NULL AUTO_INCREMENT,
		  `name` varchar(255) NOT NULL,
		  `discount_type` varchar(10) NOT NULL,
		  `discount_value` float(15,4) NOT NULL,
		  `qty_buy` int(4) NOT NULL,
		  `qty_get` int(4) NOT NULL,
		  `date_start` date NOT NULL,
		  `date_end` date NOT NULL,
		  `status` int(1) NOT NULL,
		  `position` varchar(25) NOT NULL,
		  `sort_order` int(11) NOT NULL,
		  `date_added` datetime NOT NULL,
		  `date_modified` datetime NOT NULL,
		  PRIMARY KEY (`jbuygetcombo_id`)
		) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;
		");


		/* -- Table structure for table `oc_jbuygetcombo_buy_category` */
		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."jbuygetcombo_buy_category` (
		  `jbuygetcombo_id` int(11) NOT NULL,
		  `category_id` int(11) NOT NULL,
		  PRIMARY KEY (`jbuygetcombo_id`,`category_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");


		/* -- Table structure for table `oc_jbuygetcombo_buy_manufacturer` */
		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."jbuygetcombo_buy_manufacturer` (
		  `jbuygetcombo_id` int(11) NOT NULL,
		  `manufacturer_id` int(11) NOT NULL,
		  PRIMARY KEY (`jbuygetcombo_id`,`manufacturer_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");


		/* -- Table structure for table `oc_jbuygetcombo_buy_product` */
		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."jbuygetcombo_buy_product` (
		  `jbuygetcombo_id` int(11) NOT NULL,
		  `product_id` int(11) NOT NULL,
		  PRIMARY KEY (`jbuygetcombo_id`,`product_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");


		/* -- Table structure for table `oc_jbuygetcombo_description` */
		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."jbuygetcombo_description` (
		  `jbuygetcombo_id` int(11) NOT NULL,
		  `language_id` int(11) NOT NULL,
		  `text_ribbon` varchar(255) NOT NULL,
		  `text_order_total` varchar(255) NOT NULL,
		  `text_popup_btn` varchar(255) NOT NULL,
		  `text_popup_btn_close` varchar(255) NOT NULL,
		  `text_tab` varchar(255) NOT NULL,
		  `combo_title` varchar(255) NOT NULL,
		  `combo_description` mediumtext NOT NULL,
		  PRIMARY KEY (`jbuygetcombo_id`,`language_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");


		/* -- Table structure for table `oc_jbuygetcombo_get_category` */

		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."jbuygetcombo_get_category` (
		  `jbuygetcombo_id` int(11) NOT NULL,
		  `category_id` int(11) NOT NULL,
		  PRIMARY KEY (`jbuygetcombo_id`,`category_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");


		/* -- Table structure for table `oc_jbuygetcombo_get_manufacturer` */

		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."jbuygetcombo_get_manufacturer` (
		  `jbuygetcombo_id` int(11) NOT NULL,
		  `manufacturer_id` int(11) NOT NULL,
		  PRIMARY KEY (`jbuygetcombo_id`,`manufacturer_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");


		/* -- Table structure for table `oc_jbuygetcombo_get_product` */
		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."jbuygetcombo_get_product` (
		  `jbuygetcombo_id` int(11) NOT NULL,
		  `product_id` int(11) NOT NULL,
		  PRIMARY KEY (`jbuygetcombo_id`,`product_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");


		/* -- Table structure for table `oc_jbuygetcombo_to_customer_group` */
		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."jbuygetcombo_to_customer_group` (
		  `jbuygetcombo_id` int(11) NOT NULL,
		  `customer_group_id` int(11) NOT NULL,
		  PRIMARY KEY (`jbuygetcombo_id`,`customer_group_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");


		/* -- Table structure for table `oc_jbuygetcombo_to_store` */
		$this->db->query("CREATE TABLE IF NOT EXISTS `". DB_PREFIX ."jbuygetcombo_to_store` (
		  `jbuygetcombo_id` int(11) NOT NULL,
		  `store_id` int(11) NOT NULL,
		  PRIMARY KEY (`jbuygetcombo_id`,`store_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		");
	}
}
