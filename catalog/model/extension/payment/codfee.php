<?php
class ModelExtensionPaymentCodfee extends Model {
	public function getMethod($address, $total) {
		$this->load->language('extension/payment/codfee');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('codfee_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->cart->hasShipping()) {
			$status = false;
		} elseif (!$this->config->get('codfee_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$type = $this->config->get('codfee_type');
			$exclude_shippings = (array)$this->config->get('codfee_exclude_shipping');
			$cart_total = $this->cart->getSubTotal();
			$codfee_totals = (array)$this->config->get('codfee_total');
			$codfee_cost= 0;

			$found_exclude_shipping = false;

			foreach ($this->session->data['shipping_methods'] as $key => $value) {
				if(in_array($key, $exclude_shippings)) {
					if(isset($value['quote']) && isset($value['quote'][$key])) {
						$found_exclude_shipping = $value['quote'][$key]['code'] ==  $this->session->data['shipping_method']['code'];
						break;
					}
				}
			}

			if(!$found_exclude_shipping) {
				foreach ($codfee_totals as $codfee_total) {

					$has_fee_total = false;


					if($this->customer->getId()) {
						$customer_group_id = $this->customer->getGroupId();
					} else {
						$customer_group_id = $this->config->get('config_customer_group_id');
					}

					if(isset($codfee_total['customergroup']) && in_array($customer_group_id, $codfee_total['customergroup'])) {

						if(($codfee_total['from_total']!='' && $cart_total >= $codfee_total['from_total']) && $codfee_total['to_total']=='') {
							$has_fee_total = true;
						} else if($codfee_total['from_total']=='' && ($codfee_total['to_total']!='' && $cart_total <= $codfee_total['to_total'])) {
							$has_fee_total = true;
						} else if(($codfee_total['from_total']!='' && $cart_total >= $codfee_total['from_total']) && ($codfee_total['to_total']!='' && $cart_total <= $codfee_total['to_total'])) {
							$has_fee_total = true;
						}

					}				

					if($has_fee_total) {
						if ($type == 'F') {
							$codfee_cost = $codfee_total['fee'];
							break;
						} elseif ($type == 'P') {
							$codfee_cost = $cart_total * $codfee_total['fee'] / 100;
							$text_codfee = sprintf($this->language->get('text_codfee_per'), $codfee_total['fee']);
							break;
						}
					}
				}
			}

			if($codfee_cost > 0) {
				$method_data = array (
					'code'       => 'codfee',
					'title'      => sprintf($this->language->get('text_title'), $this->currency->format($this->tax->calculate($codfee_cost, $this->config->get('codfee_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency'])),
					'terms'      => '',
					'sort_order' => $this->config->get('codfee_sort_order'),
				);
			}
		}

		return $method_data;
	}

}
