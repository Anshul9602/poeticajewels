<?php
class ModelJBuyGetComboJBuyGetCombo extends Model {
	public function addJBuyGetCombo($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo SET sort_order = '" . $this->db->escape($data['sort_order']) . "', name = '" . $this->db->escape($data['name']) . "', discount_type = '" . $this->db->escape($data['discount_type']) . "', discount_value = '" . (float)$data['discount_value'] . "', qty_buy = '" . (int)$data['qty_buy'] . "', qty_get = '" . (int)$data['qty_get'] . "', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "', position = '" . $this->db->escape($data['position']) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$jbuygetcombo_id = $this->db->getLastId();

		foreach ($data['description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_description SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', language_id = '" . (int)$language_id . "', text_ribbon = '". $this->db->escape($value['text_ribbon']) ."', text_order_total = '". $this->db->escape($value['text_order_total']) ."', combo_title = '". $this->db->escape($value['combo_title']) ."', combo_description = '". $this->db->escape($value['combo_description']) ."', text_popup_btn = '". $this->db->escape($value['text_popup_btn']) ."', text_popup_btn_close = '". $this->db->escape($value['text_popup_btn_close']) ."', text_tab = '". $this->db->escape($value['text_tab']) ."'");

		}

		if(isset($data['store'])) {
			foreach ($data['store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_to_store SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if(isset($data['customer_group'])) {
			foreach ($data['customer_group'] as $customer_group_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_to_customer_group SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', customer_group_id = '" . (int)$customer_group_id . "'");
			}
		}

		if(isset($data['buy_category'])) {
			foreach ($data['buy_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_buy_category SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if(isset($data['buy_product'])) {
			foreach ($data['buy_product'] as $product_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_buy_product SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', product_id = '" . (int)$product_id . "'");
			}
		}

		if(isset($data['buy_manufacturer'])) {
			foreach ($data['buy_manufacturer'] as $manufacturer_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_buy_manufacturer SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', manufacturer_id = '" . (int)$manufacturer_id . "'");
			}
		}

		if(isset($data['get_category'])) {
			foreach ($data['get_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_get_category SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if(isset($data['get_product'])) {
			foreach ($data['get_product'] as $product_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_get_product SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', product_id = '" . (int)$product_id . "'");
			}
		}

		if(isset($data['get_manufacturer'])) {
			foreach ($data['get_manufacturer'] as $manufacturer_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_get_manufacturer SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', manufacturer_id = '" . (int)$manufacturer_id . "'");
			}
		}

		return $jbuygetcombo_id;
	}

	public function editJBuyGetCombo($jbuygetcombo_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "jbuygetcombo SET sort_order = '" . $this->db->escape($data['sort_order']) . "', name = '" . $this->db->escape($data['name']) . "', discount_type = '" . $this->db->escape($data['discount_type']) . "', discount_value = '" . (float)$data['discount_value'] . "', qty_buy = '" . (int)$data['qty_buy'] . "', qty_get = '" . (int)$data['qty_get'] . "', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "', position = '" . $this->db->escape($data['position']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE jbuygetcombo_id = '". (int)$jbuygetcombo_id ."'");


		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_description WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");

		foreach ($data['description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_description SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', language_id = '" . (int)$language_id . "', text_ribbon = '". $this->db->escape($value['text_ribbon']) ."', text_order_total = '". $this->db->escape($value['text_order_total']) ."', combo_title = '". $this->db->escape($value['combo_title']) ."', combo_description = '". $this->db->escape($value['combo_description']) ."', text_popup_btn = '". $this->db->escape($value['text_popup_btn']) ."', text_popup_btn_close = '". $this->db->escape($value['text_popup_btn_close']) ."', text_tab = '". $this->db->escape($value['text_tab']) ."'");

		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_to_store WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");

		if(isset($data['store'])) {
			foreach ($data['store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_to_store SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_to_customer_group WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");

		if(isset($data['customer_group'])) {
			foreach ($data['customer_group'] as $customer_group_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_to_customer_group SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', customer_group_id = '" . (int)$customer_group_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_buy_category WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");

		if(isset($data['buy_category'])) {
			foreach ($data['buy_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_buy_category SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_buy_product WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");

		if(isset($data['buy_product'])) {
			foreach ($data['buy_product'] as $product_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_buy_product SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', product_id = '" . (int)$product_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_buy_manufacturer WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");

		if(isset($data['buy_manufacturer'])) {
			foreach ($data['buy_manufacturer'] as $manufacturer_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_buy_manufacturer SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', manufacturer_id = '" . (int)$manufacturer_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_get_category WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");

		if(isset($data['get_category'])) {
			foreach ($data['get_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_get_category SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_get_product WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");

		if(isset($data['get_product'])) {
			foreach ($data['get_product'] as $product_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_get_product SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', product_id = '" . (int)$product_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_get_manufacturer WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");

		if(isset($data['get_manufacturer'])) {
			foreach ($data['get_manufacturer'] as $manufacturer_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "jbuygetcombo_get_manufacturer SET jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "', manufacturer_id = '" . (int)$manufacturer_id . "'");
			}
		}
	}

	public function deleteJBuyGetCombo($jbuygetcombo_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_description WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_to_store WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_to_customer_group WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_buy_category WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_buy_product WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_buy_manufacturer WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_get_category WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_get_product WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "jbuygetcombo_get_manufacturer WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
	}

	public function getJBuyGetCombo($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");

		if($query->num_rows) {
			$query->row['description'] = $this->getJBuyGetComboDescription($query->row['jbuygetcombo_id']);
			$query->row['customer_group'] = $this->getJBuyGetComboCustomerGroups($query->row['jbuygetcombo_id']);
			$query->row['store'] = $this->getJBuyGetComboStores($query->row['jbuygetcombo_id']);
			$query->row['buy_category'] = $this->getJBuyGetComboBuyCategories($query->row['jbuygetcombo_id']);
			$query->row['buy_product'] = $this->getJBuyGetComboBuyProducts($query->row['jbuygetcombo_id']);
			$query->row['buy_manufacturer'] = $this->getJBuyGetComboBuyManufacturers($query->row['jbuygetcombo_id']);
			$query->row['get_category'] = $this->getJBuyGetComboGetCategories($query->row['jbuygetcombo_id']);
			$query->row['get_product'] = $this->getJBuyGetComboGetProducts($query->row['jbuygetcombo_id']);
			$query->row['get_manufacturer'] = $this->getJBuyGetComboGetManufacturers($query->row['jbuygetcombo_id']);

			return $query->row;
		} else {
			return array();
		}
	}

	public function getJBuyGetComboDescription($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo_description WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$data = array();
		foreach ($query->rows as $value) {
			$data[$value['language_id']] = $value;
		}
		return $data;
	}

	public function getJBuyGetComboCustomerGroups($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo_to_customer_group WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$data = array();
		foreach ($query->rows as $value) {
			$data[] = $value['customer_group_id'];
		}
		return $data;
	}

	public function getJBuyGetComboStores($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo_to_store WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$data = array();
		foreach ($query->rows as $value) {
			$data[] = $value['store_id'];
		}
		return $data;
	}

	public function getJBuyGetComboBuyCategories($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo_buy_category WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$data = array();
		foreach ($query->rows as $value) {
			$data[] = $value['category_id'];
		}
		return $data;
	}

	public function getJBuyGetComboBuyProducts($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo_buy_product WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$data = array();
		foreach ($query->rows as $value) {
			$data[] = $value['product_id'];
		}
		return $data;
	}

	public function getJBuyGetComboBuyManufacturers($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo_buy_manufacturer WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$data = array();
		foreach ($query->rows as $value) {
			$data[] = $value['manufacturer_id'];
		}
		return $data;
	}

	public function getJBuyGetComboGetCategories($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo_get_category WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$data = array();
		foreach ($query->rows as $value) {
			$data[] = $value['category_id'];
		}
		return $data;
	}

	public function getJBuyGetComboGetProducts($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo_get_product WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$data = array();
		foreach ($query->rows as $value) {
			$data[] = $value['product_id'];
		}
		return $data;
	}

	public function getJBuyGetComboGetManufacturers($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo_get_manufacturer WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$data = array();
		foreach ($query->rows as $value) {
			$data[] = $value['manufacturer_id'];
		}
		return $data;
	}

	public function getJBuyGetCombos($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "jbuygetcombo a LEFT JOIN " . DB_PREFIX . "jbuygetcombo_description ad ON (a.jbuygetcombo_id = ad.jbuygetcombo_id) WHERE ad.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_qty_buy'])) {
			$sql .= " AND a.qty_buy='" . (int)$data['filter_qty_buy'] . "'";
		}

		if (!empty($data['filter_qty_get'])) {
			$sql .= " AND a.qty_get='" . (int)$data['filter_qty_get'] . "'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(a.date_start) = DATE('" . $this->db->escape($data['filter_date_start']) . "')";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(a.date_end) = DATE('" . $this->db->escape($data['filter_date_end']) . "')";
		}

		if (!empty($data['filter_name'])) {
			$sql .= " AND ad.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_buy_category'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jbc.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_buy_category jbc LEFT JOIN " . DB_PREFIX . "category c ON (c.category_id=jbc.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id=cd.category_id) WHERE cd.language_id='". (int)$this->config->get('config_language_id') ."' AND cd.name LIKE '" . $this->db->escape($data['filter_buy_category']) . "%') ";
		}

		if (!empty($data['filter_buy_product'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jbp.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_buy_product jbp LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id=jbp.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id=pd.product_id) WHERE pd.language_id='". (int)$this->config->get('config_language_id') ."' AND pd.name LIKE '" . $this->db->escape($data['filter_buy_product']) . "%') ";
		}

		if (!empty($data['filter_buy_manufacturer'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jbm.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_buy_manufacturer jbm LEFT JOIN " . DB_PREFIX . "manufacturer m ON (m.manufacturer_id=jbm.manufacturer_id) WHERE m.name LIKE '" . $this->db->escape($data['filter_buy_manufacturer']) . "%') ";
		}

		if (!empty($data['filter_stores'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT j2s.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_to_store j2s WHERE j2s.store_id='" . (int)$data['filter_stores'] . "')";
		}

		if (!empty($data['filter_sort_order'])) {
			$sql .= " AND a.sort_order='" . (int)$data['filter_sort_order'] . "'";
		}

		if (!empty($data['filter_customer_group'])) {
			// $sql .= " AND a.jbuygetcombo_id IN (SELECT j2cg.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_to_customer_group j2cg LEFT JOIN " . DB_PREFIX . "customer_group cg ON (cg.customer_group_id=j2cg.customer_group_id) LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id=cgd.customer_group_id) WHERE cgd.language_id='". (int)$this->config->get('config_language_id') ."' AND cg.name LIKE '" . $this->db->escape($data['filter_customer_group']) . "%') ";
			$sql .= " AND a.jbuygetcombo_id IN (SELECT j2cg.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_to_customer_group j2cg LEFT JOIN " . DB_PREFIX . "customer_group cg ON (cg.customer_group_id=j2cg.customer_group_id) WHERE cg.customer_group_id='" . (int)$data['filter_customer_group'] . "') ";
		}

		if (!empty($data['filter_status'])) {
			$sql .= " AND a.status='" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_get_category'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jgc.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_get_category jgc LEFT JOIN " . DB_PREFIX . "category c ON (c.category_id=jgc.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id=cd.category_id) WHERE cd.language_id='". (int)$this->config->get('config_language_id') ."' AND cd.name LIKE '" . $this->db->escape($data['filter_get_category']) . "%') ";
		}

		if (!empty($data['filter_get_product'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jgp.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_get_product jgp LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id=jgp.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id=pd.product_id) WHERE pd.language_id='". (int)$this->config->get('config_language_id') ."' AND pd.name LIKE '" . $this->db->escape($data['filter_get_product']) . "%') ";
		}

		if (!empty($data['filter_get_manufacturer'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jgm.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_get_manufacturer jgm LEFT JOIN " . DB_PREFIX . "manufacturer m ON (m.manufacturer_id=jgm.manufacturer_id) WHERE m.name LIKE '" . $this->db->escape($data['filter_get_manufacturer']) . "%') ";
		}

		if (!empty($data['filter_discount'])) {
			$sql .= " AND a.discount = '" . $this->db->escape($data['filter_discount']) . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(a.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(a.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		$sort_data = array(
			'a.jbuygetcombo_id',
			'a.name',
			'a.discount_type',
			'a.qty_buy',
			'a.qty_get',
			'a.status',
			'a.sort_order',
			'a.date_start',
			'a.date_end',
			'a.date_added',
			'a.date_modified',
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY a.date_added";
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

		return $query->rows;
	}

	public function getTotalJBuyGetCombos($data=array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "jbuygetcombo a LEFT JOIN " . DB_PREFIX . "jbuygetcombo_description ad ON (a.jbuygetcombo_id = ad.jbuygetcombo_id) WHERE ad.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_qty_buy'])) {
			$sql .= " AND a.qty_buy='" . (int)$data['filter_qty_buy'] . "'";
		}

		if (!empty($data['filter_qty_get'])) {
			$sql .= " AND a.qty_get='" . (int)$data['filter_qty_get'] . "'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(a.date_start) = DATE('" . $this->db->escape($data['filter_date_start']) . "')";
		}
		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(a.date_end) = DATE('" . $this->db->escape($data['filter_date_end']) . "')";
		}

		if (!empty($data['filter_name'])) {
			$sql .= " AND ad.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_buy_category'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jbc.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_buy_category jbc LEFT JOIN " . DB_PREFIX . "category c ON (c.category_id=jbc.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id=cd.category_id) WHERE cd.language_id='". (int)$this->config->get('config_language_id') ."' AND cd.name LIKE '" . $this->db->escape($data['filter_buy_category']) . "%') ";
		}

		if (!empty($data['filter_buy_product'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jbp.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_buy_product jbp LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id=jbp.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id=pd.product_id) WHERE pd.language_id='". (int)$this->config->get('config_language_id') ."' AND pd.name LIKE '" . $this->db->escape($data['filter_buy_product']) . "%') ";
		}

		if (!empty($data['filter_buy_manufacturer'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jbm.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_buy_manufacturer jbm LEFT JOIN " . DB_PREFIX . "manufacturer m ON (m.manufacturer_id=jbm.manufacturer_id) WHERE m.name LIKE '" . $this->db->escape($data['filter_buy_manufacturer']) . "%') ";
		}

		if (!empty($data['filter_stores'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT j2s.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_to_store j2s WHERE j2s.store_id='" . (int)$data['filter_stores'] . "')";
		}

		if (!empty($data['filter_sort_order'])) {
			$sql .= " AND a.sort_order='" . (int)$data['filter_sort_order'] . "'";
		}

		if (!empty($data['filter_customer_group'])) {
			// $sql .= " AND a.jbuygetcombo_id IN (SELECT j2cg.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_to_customer_group j2cg LEFT JOIN " . DB_PREFIX . "customer_group cg ON (cg.customer_group_id=j2cg.customer_group_id) LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id=cgd.customer_group_id) WHERE cgd.language_id='". (int)$this->config->get('config_language_id') ."' AND cg.name LIKE '" . $this->db->escape($data['filter_customer_group']) . "%') ";
			$sql .= " AND a.jbuygetcombo_id IN (SELECT j2cg.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_to_customer_group j2cg LEFT JOIN " . DB_PREFIX . "customer_group cg ON (cg.customer_group_id=j2cg.customer_group_id) WHERE cg.customer_group_id='" . (int)$data['filter_customer_group'] . "') ";
		}

		if (!empty($data['filter_status'])) {
			$sql .= " AND a.status='" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_get_category'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jgc.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_get_category jgc LEFT JOIN " . DB_PREFIX . "category c ON (c.category_id=jgc.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id=cd.category_id) WHERE cd.language_id='". (int)$this->config->get('config_language_id') ."' AND cd.name LIKE '" . $this->db->escape($data['filter_get_category']) . "%') ";
		}

		if (!empty($data['filter_get_product'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jgp.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_get_product jgp LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id=jgp.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id=pd.product_id) WHERE pd.language_id='". (int)$this->config->get('config_language_id') ."' AND pd.name LIKE '" . $this->db->escape($data['filter_get_product']) . "%') ";
		}

		if (!empty($data['filter_get_manufacturer'])) {
			$sql .= " AND a.jbuygetcombo_id IN (SELECT jgm.jbuygetcombo_id FROM " . DB_PREFIX . "jbuygetcombo_get_manufacturer jgm LEFT JOIN " . DB_PREFIX . "manufacturer m ON (m.manufacturer_id=jgm.manufacturer_id) WHERE m.name LIKE '" . $this->db->escape($data['filter_get_manufacturer']) . "%') ";
		}

		if (!empty($data['filter_discount'])) {
			$sql .= " AND a.discount = '" . $this->db->escape($data['filter_discount']) . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(a.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(a.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
}
