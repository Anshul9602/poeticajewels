<?php
class ControllerExtensionModuleShoppingfeeder extends Controller {
    private $error = array();

    public function install()
    {
        //version 2.0.0.0 comes with "event" in the tool folder, other versions in the extension folder
        if (file_exists(DIR_APPLICATION . 'model/' . 'tool/event' . '.php'))
        {
            $this->load->model('tool/event');
            /** @var ModelToolEvent $event */
            $event = $this->model_tool_event;
        }
        else
        {
            $this->load->model('extension/event');
            /** @var ModelExtensionEvent $event */
            $event = $this->model_extension_event;
        }
	    $event->addEvent('shoppingfeeder_order', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/module/shoppingfeeder/on_order_add');
	    $event->addEvent('shoppingfeeder_pageview', 'catalog/controller/product/product/before', 'extension/module/shoppingfeeder/add_script');
    }

    public function uninstall()
    {
        //version 2.0.0.0 comes with "event" in the tool folder, other versions in the extension folder
        if (file_exists(DIR_APPLICATION . 'model/' . 'tool/event' . '.php'))
        {
            $this->load->model('tool/event');
            /** @var ModelToolEvent $event */
            $event = $this->model_tool_event;
        }
        else
        {
            $this->load->model('extension/event');
            /** @var ModelExtensionEvent $event */
            $event = $this->model_extension_event;
        }
	    $event->deleteEvent('shoppingfeeder_order');
	    $event->deleteEvent('shoppingfeeder_pageview');
    }

    public function index() {

        $this->load->language('extension/module/shoppingfeeder');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('shoppingfeeder', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['apikey'] = $this->language->get('apikey');
        $data['apisecret'] = $this->language->get('apisecret');

        $data['help_apikey'] = $this->language->get('help_apikey');
        $data['help_apisecret'] = $this->language->get('help_apisecret');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['apikey'])) {
            $data['error_apikey'] = $this->error['apikey'];
        } else {
            $data['error_apikey'] = '';
        }

        if (isset($this->error['apisecret'])) {
            $data['error_apisecret'] = $this->error['apisecret'];
        } else {
            $data['error_apisecret'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/shoppingfeeder', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['action'] = $this->url->link('extension/module/shoppingfeeder', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', 'SSL');

        if (isset($this->request->post['shoppingfeeder_apikey'])) {
            $data['shoppingfeeder_apikey'] = $this->request->post['shoppingfeeder_apikey'];
        } else {
            $data['shoppingfeeder_apikey'] = $this->config->get('shoppingfeeder_apikey');
        }

        if (isset($this->request->post['shoppingfeeder_apisecret'])) {
            $data['shoppingfeeder_apisecret'] = $this->request->post['shoppingfeeder_apisecret'];
        } else {
            $data['shoppingfeeder_apisecret'] = $this->config->get('shoppingfeeder_apisecret');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/shoppingfeeder.tpl', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'extension/module/shoppingfeeder')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['shoppingfeeder_apikey']) {
            $this->error['apikey'] = $this->language->get('error_apikey');
        }

        if (!$this->request->post['shoppingfeeder_apisecret']) {
            $this->error['apisecret'] = $this->language->get('error_apisecret');
        }

        return !$this->error;
    }
}