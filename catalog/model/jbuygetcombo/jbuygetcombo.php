<?php
class Modeljbuygetcombojbuygetcombo extends Model {
	public function getJBuyGetCombos() {
		$sql = "SELECT c.*, cd.* FROM `" . DB_PREFIX . "jbuygetcombo` c
		 	LEFT JOIN `" . DB_PREFIX . "jbuygetcombo_to_store` c2s ON(c2s.jbuygetcombo_id=c.jbuygetcombo_id)
		 	LEFT JOIN `" . DB_PREFIX . "jbuygetcombo_description` cd ON(cd.jbuygetcombo_id=c.jbuygetcombo_id)
		 	LEFT JOIN `" . DB_PREFIX . "jbuygetcombo_to_customer_group` c2cg ON(c2cg.jbuygetcombo_id=c.jbuygetcombo_id)

		 	WHERE

		    c.status='1'
		    AND cd.language_id='". (int)$this->config->get('config_language_id') ."'
		    AND c2s.store_id='". (int)$this->config->get('config_store_id') ."'
		    AND c.date_start < NOW()
		    AND ( c.date_end = '0000-00-00' OR c.date_end > NOW() )
		    AND ( c2cg.customer_group_id='". (int)$this->config->get('config_customer_group_id') ."' OR (c2cg.customer_group_id IS NULL AND c2cg.jbuygetcombo_id IS NULL ) )

		    ORDER BY sort_order ASC
		    ";

		$query = $this->db->query($sql);

		return $query->rows;
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

	public function getJBuyGetComboDescription($jbuygetcombo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "jbuygetcombo_description WHERE jbuygetcombo_id = '" . (int)$jbuygetcombo_id . "'");
		$data = array();
		foreach ($query->rows as $value) {
			$data[$value['language_id']] = $value;
		}
		return $data;
	}

	public function getCategoriesProducts($category_ids) {
		$query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product_to_category p2c LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p2c.category_id IN ('". implode("','", $category_ids) ."')");

		$product_ids = array();
		foreach ($query->rows as $row) {
			$product_ids[] = $row['product_id'];
		}
		return $product_ids;
	}

	public function getManufacturersProducts($manufacturer_ids) {
		$query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p.manufacturer_id IN ('". implode("','", $manufacturer_ids) ."')");

		$product_ids = array();
		foreach ($query->rows as $row) {
			$product_ids[] = $row['product_id'];
		}
		return $product_ids;
	}
}