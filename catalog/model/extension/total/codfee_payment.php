<?php
class ModelExtensionTotalCodfeePayment extends Model {
	public function getTotal($total) {
		if (isset($this->session->data['payment_method']['code']) && $this->session->data['payment_method']['code'] == 'codfee') {	

			$this->load->language('extension/payment/codfee');
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

					if($has_fee_total)  {
						if ($type == 'F') {
							$codfee_cost= $codfee_total['fee'];
							break;							
						} elseif ($type == 'P') {
							$codfee_cost= $cart_total * $codfee_total['fee'] / 100;
							$text_codfee = sprintf($this->language->get('text_codfee_per'), $codfee_total['fee']);
							break;
						}
					}
				}

			}


			if($codfee_cost > 0) {
				$total['totals'][] = array(
					'code'       => 'codfee_payment',
					'title'      => $this->language->get('text_codfee_payment'),
					'value'      => $codfee_cost,
					'sort_order' => $this->config->get('codfee_payment_sort_order')
				);

				if ($this->config->get('codfee_tax_class_id')) {
					$tax_rates = $this->tax->getRates($codfee_cost, $this->config->get('codfee_tax_class_id'));

					foreach ($tax_rates as $tax_rate) {
						if (!isset($total['taxes'][$tax_rate['tax_rate_id']])) {
							$total['taxes'][$tax_rate['tax_rate_id']] = $tax_rate['amount'];
						} else {
							$total['taxes'][$tax_rate['tax_rate_id']] += $tax_rate['amount'];
						}
					}
				}

				$total['total'] += $codfee_cost;
			}
		}
	}
}
