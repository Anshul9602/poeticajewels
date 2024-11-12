<?php

class ControllerExtensionModuleShoppingfeeder extends Controller {
    public function preDispatch()
    {
        //check Auth
        if (!function_exists('getallheaders'))
        {
            function getallheaders()
            {
                $headers = [];
                foreach ($_SERVER as $name => $value)
                {
                    if (substr($name, 0, 5) == 'HTTP_')
                    {
                        $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
                    }
                }
                return $headers;
            }
        }

        $headers = getallheaders();

        $this->load->model('extension/module/shoppingfeeder');

        $authResult = $this->model_extension_module_shoppingfeeder->auth(
            $headers,
            ($this->request->server['HTTPS'] == 'on') ? 'https' : 'http',
            $this->request->server['REQUEST_METHOD']
        );

        if ($authResult !== true)
        {
            $responseData = array(
                'status' => 'fail',
                'data' => array (
                    'message' => $authResult
                )
            );

            header('Content-type: application/json; charset=UTF-8');
            echo json_encode($responseData);
            exit();
        }

        return $this;
    }

    public function test()
    {
        if (!function_exists('getallheaders'))
        {
            function getallheaders()
            {
                $headers = [];
                foreach ($_SERVER as $name => $value)
                {
                    if (substr($name, 0, 5) == 'HTTP_')
                    {
                        $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
                    }
                }
                return $headers;
            }
        }

        $requiresSsl = false;

        try
        {
            if (!(version_compare(VERSION, '2', '>=') && version_compare(VERSION, '3', '<')))
            {
                throw new Exception('This plugin is not designed for this version of OpenCart');
            }

            $this->load->model('extension/module/shoppingfeeder');

            //check if this setup requires SSL
            $storeUrl = $this->config->get('config_url');
            $requiresSsl = (preg_match('/^https/', $storeUrl)) ? true : false;

            $apiKeys = $this->model_extension_module_shoppingfeeder->getApiKeys();

            if (!isset($apiKeys['api_key']) || empty($apiKeys['api_key']))
            {
                throw new Exception('API key not setup.');
            }

            if (!isset($apiKeys['api_secret']) || empty($apiKeys['api_secret']))
            {
                throw new Exception('API secret not setup.');
            }

            $headers = getallheaders();

            $authResult = $this->model_extension_module_shoppingfeeder->auth(
                $headers,
                ($this->request->server['HTTPS'] == 'on') ? 'https' : 'http',
                $this->request->server['REQUEST_METHOD']
            );

            if ($authResult === true)
            {
                set_time_limit(0);

                $responseData = array(
                    'status' => 'success',
                    'data' => array(
                        'message' => 'Authorization OK',
                        'requires_ssl' => $requiresSsl
                    )
                );
            }
            else
            {
                $responseData = array(
                    'status' => 'fail',
                    'data' => array (
                        'message' => 'Authorization failed: ['.$authResult.']',
                        'requires_ssl' => $requiresSsl
                    )
                );
            }
        }
        catch (Exception $e)
        {
            $responseData = array(
                'status' => 'fail',
                'data' => array (
                    'message' => $e->getMessage(),
                    'requires_ssl' => $requiresSsl
                )
            );
        }

        header('Content-type: application/json; charset=UTF-8');
        echo json_encode($responseData);
        exit();
    }

    public function offers()
    {
        set_time_limit(0);

        $this->preDispatch();

        $page = isset($this->request->get['page']) ? $this->request->get['page'] : null;
        $numPerPage = isset($this->request->get['num_per_page']) ? $this->request->get['num_per_page'] : 1000;
        $offerId = isset($this->request->get['offer_id']) ? $this->request->get['offer_id'] : null;
        $lastUpdate = isset($this->request->get['last_update']) ? $this->request->get['last_update'] : null;

        $filter_data = array();
        if (!is_null($page))
        {
            $filter_data = array(
                'start'           => ($page - 1) * $numPerPage,
                'limit'           => $numPerPage
            );
        }

        $this->load->model('extension/module/shoppingfeeder');

        if (is_null($offerId))
        {
            $offers = $this->model_extension_module_shoppingfeeder->getOffers($filter_data, $lastUpdate);
        }
        else
        {
            $offers = $this->model_extension_module_shoppingfeeder->getOffer($offerId, $lastUpdate);
        }

        $responseData = array(
            'status' => 'success',
            'data' => array(
                'page' => $page,
                'num_per_page' => $numPerPage,
                'offers' => $offers
            )
        );

        header('Content-type: application/json; charset=UTF-8');
        echo json_encode($responseData);
        exit();
    }

    public function orders()
    {
        set_time_limit(0);

        $this->preDispatch();

        $this->load->model('extension/module/shoppingfeeder');

        $page = isset($this->request->get['page']) ? $this->request->get['page'] : null;
        $numPerPage = isset($this->request->get['num_per_page']) ? $this->request->get['num_per_page'] : 1000;

        $orderStatus = isset($this->request->get['order_status']) ? $this->request->get['order_status'] :
            implode(',',array_merge($this->config->get('config_processing_status'), $this->config->get('config_complete_status')));
        $fromDate = isset($this->request->get['from_date']) ? $this->request->get['from_date'] : '1970-01-01 00:00:00';
        $toDate = isset($this->request->get['to_date']) ? $this->request->get['to_date'] : '2100-01-01 23:59:59';
        $orderId = isset($this->request->get['order_id']) ? $this->request->get['order_id'] : null;

        $filter_data = array();
        if (!is_null($page))
        {
            $filter_data = array(
                'filter_order_status' => $orderStatus,
                'start'           => ($page - 1) * $numPerPage,
                'limit'           => $numPerPage,
                'from_date'       => $fromDate,
                'to_date'         => $toDate
            );
        }

        if (is_null($orderId))
        {
            $orders = $this->model_extension_module_shoppingfeeder->getOrders($filter_data);
        }
        else
        {
            $orders = $this->model_extension_module_shoppingfeeder->getOrder($orderId);
        }

        $responseData = array(
            'status' => 'success',
            'data' => array(
                'page' => $page,
                'num_per_page' => $numPerPage,
                'orders' => $orders
            )
        );

        header('Content-type: application/json; charset=UTF-8');
        echo json_encode($responseData);
        exit();
    }


    public function version()
    {
        $this->load->model('extension/module/shoppingfeeder');

        $responseData = array(
            'status' => 'success',
            'data' => array(
                'version' => $this->model_extension_module_shoppingfeeder->getVersion()
            )
        );

        header('Content-type: application/json; charset=UTF-8');
        echo json_encode($responseData);
        exit();
    }

    public function attributes()
    {
        set_time_limit(0);

        $this->preDispatch();

        $this->load->model('extension/module/shoppingfeeder');

        $attributes = $this->model_extension_module_shoppingfeeder->getAttributes();

        $responseData = array(
            'status' => 'success',
            'data' => array(
                'attributes' => $attributes
            )
        );

        header('Content-type: application/json; charset=UTF-8');
        echo json_encode($responseData);
        exit();
    }


    public function on_order_add($orderId)
    {
	    $sfdrCookieName = '_sfdr_ref_ptcid';
	    $gclidCookieName = '_sfdr_ref_gclid';

	    try {
            $this->load->model('extension/module/shoppingfeeder');
            $orders = $this->model_extension_module_shoppingfeeder->getOrder($orderId);
            $order = array_pop($orders);

            $data = array();

//            $data['landing_site_ref'] = isset($_COOKIE['tracking']) ? $_COOKIE['tracking'] : '';
            $data['landing_site_ref'] = isset($this->request->cookie['tracking']) ? $this->request->cookie['tracking'] : '';
		    if (isset($this->request->cookie[$gclidCookieName]))
		    {
			    $data['landing_site_ref'] = 'SFDR_PT__' . $this->request->cookie[$gclidCookieName];
		    }
            $data['order'] = $order;
            //make sure we have timezone information
            $data['order']['date_add'] = date("c", strtotime($order['order_date']));


            $host = 'https://www.shoppingfeeder.com';
            $path = '/webhook/opencart-orders';
//            $host = 'https://shoppingfeeder-eiw083v6j4oe.runscope.net';
//            $path = '/';
            $pest = new SF_PestJSON($host);

            $apiKeys = $this->model_extension_module_shoppingfeeder->getApiKeys();

            $headers = array( 'X-SFApiKey'  =>  $apiKeys['api_key'] );

            return $pest->post($path, $data, $headers);
        }
        catch (Exception $e) {
            //do nothing
        }

        return true;
    }


	public function add_script()
	{
		try {
			$this->document->addScript('https://sfdr.co/sfdr.js');
		}
		catch (Exception $e) {
			//do nothing
		}
	}
}

/**
 * SF_Pest is a REST client for PHP.
 *
 * See http://github.com/educoder/pest for details.
 *
 * This code is licensed for use, modification, and distribution
 * under the terms of the MIT License (see http://en.wikipedia.org/wiki/MIT_License)
 */
class SF_Pest
{
    /**
     * @var array Default CURL options
     */
    public $curl_opts = array(
        CURLOPT_RETURNTRANSFER => true, // return result instead of echoing
        CURLOPT_SSL_VERIFYPEER => false, // stop cURL from verifying the peer's certificate
        CURLOPT_FOLLOWLOCATION => false, // follow redirects, Location: headers
        CURLOPT_MAXREDIRS => 10, // but dont redirect more than 10 times
        CURLOPT_HTTPHEADER => array()
    );

    /**
     * @var string Base URL
     */
    public $base_url;

    /**
     * @var array Last response
     */
    public $last_response;

    /**
     * @var array Last request
     */
    public $last_request;

    /**
     * @var array Last headers
     */
    public $last_headers;

    /**
     * @var bool Throw exceptions on HTTP error codes
     */
    public $throw_exceptions = true;


    /**
     * Class constructor
     * @param string $base_url
     * @throws Exception
     */
    public function __construct($base_url)
    {
        if (!function_exists('curl_init')) {
            throw new Exception('CURL module not available! SF_Pest requires CURL. See http://php.net/manual/en/book.curl.php');
        }

        /*
         * Only enable CURLOPT_FOLLOWLOCATION if safe_mode and open_base_dir are
         * not in use
         */
        if (ini_get('open_basedir') == '' && strtolower(ini_get('safe_mode')) == 'off') {
            $this->curl_opts['CURLOPT_FOLLOWLOCATION'] = true;
        }

        $this->base_url = $base_url;

        // The callback to handle return headers
        // Using PHP 5.2, it cannot be initialised in the static context
        $this->curl_opts[CURLOPT_HEADERFUNCTION] = array($this, 'handle_header');
    }

    /**
     * Setup authentication
     *
     * @param string $user
     * @param string $pass
     * @param string $auth  Can be 'basic' or 'digest'
     */
    public function setupAuth($user, $pass, $auth = 'basic')
    {
        $this->curl_opts[CURLOPT_HTTPAUTH] = constant('CURLAUTH_' . strtoupper($auth));
        $this->curl_opts[CURLOPT_USERPWD] = $user . ":" . $pass;
    }

    /**
     * Set cookies for this session
     * @param array $cookies
     *
     * @see http://curl.haxx.se/docs/manpage.html
     * @see http://www.nczonline.net/blog/2009/05/05/http-cookies-explained/
     */
    public function setupCookies($cookies)
    {
        if (empty($cookies)) {
            return;
        }
        $cookie_list = array();
        foreach ($cookies as $cookie_name => $cookie_value)
        {
            $cookie = urlencode($cookie_name);
            if (isset($cookie_value))
            {
                $cookie .= '=';
                $cookie .= urlencode($cookie_value);
            }
            $cookie_list[] = $cookie;
        }
        $this->curl_opts[CURLOPT_COOKIE] = implode(';', $cookie_list);
    }

    /**
     * Setup proxy
     * @param string $host
     * @param int $port
     * @param string $user Optional.
     * @param string $pass Optional.
     */
    public function setupProxy($host, $port, $user = NULL, $pass = NULL)
    {
        $this->curl_opts[CURLOPT_PROXYTYPE] = 'HTTP';
        $this->curl_opts[CURLOPT_PROXY] = $host;
        $this->curl_opts[CURLOPT_PROXYPORT] = $port;
        if ($user && $pass) {
            $this->curl_opts[CURLOPT_PROXYUSERPWD] = $user . ":" . $pass;
        }
    }

    /**
     * Perform HTTP GET request
     *
     * @param string $url
     * @param array $data
     * @param array $headers
     * @return string
     */
    public function get($url, $data = array(), $headers=array())
    {
        if (!empty($data)) {
            $pos = strpos($url, '?');
            if ($pos !== false) {
                $url = substr($url, 0, $pos);
            }
            $url .= '?' . http_build_query($data);
        }

        $curl_opts = $this->curl_opts;

        $curl_opts[CURLOPT_HTTPHEADER] = $this->prepHeaders($headers);

        $curl = $this->prepRequest($curl_opts, $url);
        $body = $this->doRequest($curl);
        $body = $this->processBody($body);

        return $body;
    }

    /**
     * Prepare request
     *
     * @param array $opts
     * @param string $url
     * @return resource
     * @throws SF_Pest_Curl_Init
     */
    protected function prepRequest($opts, $url)
    {
        if (strncmp($url, $this->base_url, strlen($this->base_url)) != 0) {
            $url = rtrim($this->base_url, '/') . '/' . ltrim($url, '/');
        }

        $curl = curl_init($url);
        if ($curl === false) {
            throw new SF_Pest_Curl_Init($this->processError(curl_error($curl), 'curl'));
        }

        foreach ($opts as $opt => $val)
            curl_setopt($curl, $opt, $val);

        $this->last_request = array(
            'url' => $url
        );

        if (isset($opts[CURLOPT_CUSTOMREQUEST]))
            $this->last_request['method'] = $opts[CURLOPT_CUSTOMREQUEST];
        else
            $this->last_request['method'] = 'GET';

        if (isset($opts[CURLOPT_POSTFIELDS]))
            $this->last_request['data'] = $opts[CURLOPT_POSTFIELDS];

        return $curl;
    }

    /**
     * Determines if a given array is numerically indexed or not
     *
     * @param array $array
     * @return boolean
     */
    protected function _isNumericallyIndexedArray($array)
    {
        return !(bool)count(array_filter(array_keys($array), 'is_string'));
    }

    /**
     * Flatten headers from an associative array to a numerically indexed array of "Name: Value"
     * style entries like CURLOPT_HTTPHEADER expects. Numerically indexed arrays are not modified.
     *
     * @param array $headers
     * @return array
     */
    protected function prepHeaders($headers)
    {
        if ($this->_isNumericallyIndexedArray($headers)) {
            return $headers;
        }

        $flattened = array();
        foreach ($headers as $name => $value) {
            $flattened[] = $name . ': ' . $value;
        }

        return $flattened;
    }

    /**
     * Process error
     * @param string $body
     * @return string
     */
    protected function processError($body)
    {
        // Override this in classes that extend SF_Pest.
        // The body of every erroneous (non-2xx/3xx) GET/POST/PUT/DELETE
        // response goes through here prior to being used as the 'message'
        // of the resulting SF_Pest_Exception
        return $body;
    }

    /**
     * Do CURL request
     * @param resource $curl
     * @return mixed
     * @throws SF_Pest_Curl_Exec
     * @throws SF_Pest_Curl_Meta
     */
    private function doRequest($curl)
    {
        $this->last_headers = array();
        $this->last_response = array();

        // curl_error() needs to be tested right after function failure
        $this->last_response["body"] = curl_exec($curl);
        if ($this->last_response["body"] === false && $this->throw_exceptions) {
            throw new SF_Pest_Curl_Exec(curl_error($curl));
        }

        $this->last_response["meta"] = curl_getinfo($curl);
        if ($this->last_response["meta"] === false && $this->throw_exceptions) {
            throw new SF_Pest_Curl_Meta(curl_error($curl));
        }

        curl_close($curl);

        $this->checkLastResponseForError();

        return $this->last_response["body"];
    }

    /**
     * Check last response for error
     *
     * @throws SF_Pest_Conflict
     * @throws SF_Pest_Gone
     * @throws SF_Pest_Unauthorized
     * @throws SF_Pest_ClientError
     * @throws SF_Pest_MethodNotAllowed
     * @throws SF_Pest_NotFound
     * @throws SF_Pest_BadRequest
     * @throws SF_Pest_UnknownResponse
     * @throws SF_Pest_InvalidRecord
     * @throws SF_Pest_ServerError
     * @throws SF_Pest_Forbidden
     */
    protected function checkLastResponseForError()
    {
        if (!$this->throw_exceptions)
            return;

        $meta = $this->last_response['meta'];
        $body = $this->last_response['body'];

        if ($meta === false)
            return;

        switch ($meta['http_code']) {
            case 400:
                throw new SF_Pest_BadRequest($this->processError($body));
                break;
            case 401:
                throw new SF_Pest_Unauthorized($this->processError($body));
                break;
            case 403:
                throw new SF_Pest_Forbidden($this->processError($body));
                break;
            case 404:
                throw new SF_Pest_NotFound($this->processError($body));
                break;
            case 405:
                throw new SF_Pest_MethodNotAllowed($this->processError($body));
                break;
            case 409:
                throw new SF_Pest_Conflict($this->processError($body));
                break;
            case 410:
                throw new SF_Pest_Gone($this->processError($body));
                break;
            case 422:
                // Unprocessable Entity -- see http://www.iana.org/assignments/http-status-codes
                // This is now commonly used (in Rails, at least) to indicate
                // a response to a request that is syntactically correct,
                // but semantically invalid (for example, when trying to
                // create a resource with some required fields missing)
                throw new SF_Pest_InvalidRecord($this->processError($body));
                break;
            default:
                if ($meta['http_code'] >= 400 && $meta['http_code'] <= 499)
                    throw new SF_Pest_ClientError($this->processError($body));
                elseif ($meta['http_code'] >= 500 && $meta['http_code'] <= 599)
                    throw new SF_Pest_ServerError($this->processError($body)); elseif (!isset($meta['http_code']) || $meta['http_code'] >= 600) {
                    throw new SF_Pest_UnknownResponse($this->processError($body));
                }
        }
    }

    /**
     * Process body
     * @param string $body
     * @return string
     */
    protected function processBody($body)
    {
        // Override this in classes that extend SF_Pest.
        // The body of every GET/POST/PUT/DELETE response goes through
        // here prior to being returned.
        return $body;
    }

    /**
     * Perform HTTP HEAD request
     * @param string $url
     * @return string
     */
    public function head($url)
    {
        $curl_opts = $this->curl_opts;
        $curl_opts[CURLOPT_NOBODY] = true;

        $curl = $this->prepRequest($curl_opts, $url);
        $body = $this->doRequest($curl);

        $body = $this->processBody($body);

        return $body;
    }

    /**
     * Perform HTTP POST request
     *
     * @param string $url
     * @param array $data
     * @param array $headers
     * @return string
     */
    public function post($url, $data, $headers = array())
    {
        $data = $this->prepData($data);

        $curl_opts = $this->curl_opts;
        $curl_opts[CURLOPT_CUSTOMREQUEST] = 'POST';
        if (!is_array($data)) $headers[] = 'Content-Length: ' . strlen($data);
        $curl_opts[CURLOPT_HTTPHEADER] = $this->prepHeaders($headers);
        $curl_opts[CURLOPT_POSTFIELDS] = $data;

        $curl = $this->prepRequest($curl_opts, $url);
        $body = $this->doRequest($curl);

        $body = $this->processBody($body);

        return $body;
    }

    /**
     * Prepare data
     * @param array $data
     * @return array|string
     */
    public function prepData($data)
    {
        if (is_array($data)) {
            $multipart = false;

            foreach ($data as $item) {
                if (is_string($item) && strncmp($item, "@", 1) == 0 && is_file(substr($item, 1))) {
                    $multipart = true;
                    break;
                }
            }

            return ($multipart) ? $data : http_build_query($data);
        } else {
            return $data;
        }
    }

    /**
     * Perform HTTP PUT request
     *
     * @param string $url
     * @param array $data
     * @param array $headers
     * @return string
     */
    public function put($url, $data, $headers = array())
    {
        $data = $this->prepData($data);

        $curl_opts = $this->curl_opts;
        $curl_opts[CURLOPT_CUSTOMREQUEST] = 'PUT';
        if (!is_array($data)) $headers[] = 'Content-Length: ' . strlen($data);
        $curl_opts[CURLOPT_HTTPHEADER] = $this->prepHeaders($headers);
        $curl_opts[CURLOPT_POSTFIELDS] = $data;

        $curl = $this->prepRequest($curl_opts, $url);
        $body = $this->doRequest($curl);

        $body = $this->processBody($body);

        return $body;
    }

    /**
     * Perform HTTP PATCH request
     *
     * @param string $url
     * @param array $data
     * @param array $headers
     * @return string
     */
    public function patch($url, $data, $headers = array())
    {
        $data = (is_array($data)) ? http_build_query($data) : $data;

        $curl_opts = $this->curl_opts;
        $curl_opts[CURLOPT_CUSTOMREQUEST] = 'PATCH';
        $headers[] = 'Content-Length: ' . strlen($data);
        $curl_opts[CURLOPT_HTTPHEADER] = $this->prepHeaders($headers);
        $curl_opts[CURLOPT_POSTFIELDS] = $data;

        $curl = $this->prepRequest($curl_opts, $url);
        $body = $this->doRequest($curl);

        $body = $this->processBody($body);

        return $body;
    }

    /**
     * Perform HTTP DELETE request
     *
     * @param string $url
     * @param array $headers
     * @return string
     */
    public function delete($url, $headers=array())
    {
        $curl_opts = $this->curl_opts;
        $curl_opts[CURLOPT_CUSTOMREQUEST] = 'DELETE';
        $curl_opts[CURLOPT_HTTPHEADER] = $this->prepHeaders($headers);

        $curl = $this->prepRequest($curl_opts, $url);
        $body = $this->doRequest($curl);

        $body = $this->processBody($body);

        return $body;
    }

    /**
     * Get last response body
     *
     * @return string
     */
    public function lastBody()
    {
        return $this->last_response['body'];
    }

    /**
     * Get last response status
     *
     * @return int
     */
    public function lastStatus()
    {
        return $this->last_response['meta']['http_code'];
    }

    /**
     * Return the last response header (case insensitive) or NULL if not present.
     * HTTP allows empty headers (e.g. RFC 2616, Section 14.23), thus is_null()
     * and not negation or empty() should be used.
     *
     * @param string $header
     * @return string
     */
    public function lastHeader($header)
    {
        if (empty($this->last_headers[strtolower($header)])) {
            return NULL;
        }
        return $this->last_headers[strtolower($header)];
    }

    /**
     * Handle header
     * @param $ch
     * @param $str
     * @return int
     */
    private function handle_header($ch, $str)
    {
        if (preg_match('/([^:]+):\s(.+)/m', $str, $match)) {
            $this->last_headers[strtolower($match[1])] = trim($match[2]);
        }
        return strlen($str);
    }
}

class SF_Pest_Exception extends Exception
{}
class SF_Pest_UnknownResponse extends SF_Pest_Exception
{}

// HTTP Errors
/* 401-499 */
class SF_Pest_ClientError extends SF_Pest_Exception
{}
/* 400 */
class SF_Pest_BadRequest extends SF_Pest_ClientError
{}
/* 401 */
class SF_Pest_Unauthorized extends SF_Pest_ClientError
{}
/* 403 */
class SF_Pest_Forbidden extends SF_Pest_ClientError
{}
/* 404 */
class SF_Pest_NotFound extends SF_Pest_ClientError
{}
/* 405 */
class SF_Pest_MethodNotAllowed extends SF_Pest_ClientError
{}
/* 409 */
class SF_Pest_Conflict extends SF_Pest_ClientError
{}
/* 410 */
class SF_Pest_Gone extends SF_Pest_ClientError
{}
/* 422 */
class SF_Pest_InvalidRecord extends SF_Pest_ClientError
{}
/* 500-599 */
class SF_Pest_ServerError extends SF_Pest_ClientError
{}

// CURL Errors
/* init */
class SF_Pest_Curl_Init extends SF_Pest_Exception
{}
/* meta */
class SF_Pest_Curl_Meta extends SF_Pest_Exception
{}
/* exec */
class SF_Pest_Curl_Exec extends SF_Pest_Exception
{}

class SF_PestJSON extends SF_Pest
{
    const JSON_ERROR_UNKNOWN = 1000;

    /**
     * @var bool Throw exceptions on JSON encoding errors?
     */
    public $throwJsonExceptions = true;

    /**
     * Perform an HTTP POST
     *
     * @param string $url
     * @param array $data
     * @param array $headers
     * @return string
     */
    public function post($url, $data, $headers = array())
    {
        return parent::post($url, $this->jsonEncode($data), $headers);
    }

    /**
     * Perform HTTP PUT
     *
     * @param string $url
     * @param array $data
     * @param array $headers
     * @return string
     */
    public function put($url, $data, $headers = array())
    {
        return parent::put($url, $this->jsonEncode($data), $headers);
    }

    /**
     * JSON encode with error checking
     *
     * @param mixed $data
     * @return string
     * @throws SF_Pest_Json_Encode
     */
    public function jsonEncode($data)
    {
        $ret = json_encode($data);

        if ($ret === false && $this->throwJsonExceptions) {
            throw new SF_Pest_Json_Encode(
                'Encoding error: ' . $this->getLastJsonErrorMessage(),
                $this->getLastJsonErrorCode()
            );
        }

        return $ret;
    }

    /**
     * Decode a JSON string with error checking
     *
     * @param string $data
     * @param bool $asArray
     * @throws SF_Pest_Json_Decode
     * @return mixed
     */
    public function jsonDecode($data, $asArray=true)
    {
        $ret = json_decode($data, $asArray);

        if ($ret === null && $this->hasJsonDecodeFailed() && $this->throwJsonExceptions) {
            throw new SF_Pest_Json_Decode(
                'Decoding error: ' . $this->getLastJsonErrorMessage(),
                $this->getLastJsonErrorCode()
            );
        }

        return $ret;
    }

    /**
     * Get last JSON error message
     *
     * @return string
     */
    public function getLastJsonErrorMessage()
    {
        // For PHP < 5.3, just return "Unknown"
        if (!function_exists('json_last_error')) {
            return "Unknown";
        }

        // Use the newer JSON error message function if it exists
        if (function_exists('json_last_error_msg')) {
            return(json_last_error_msg());
        }

        $lastError = json_last_error();

        // PHP 5.3+ only
        if (defined('JSON_ERROR_UTF8') && $lastError === JSON_ERROR_UTF8) {
            return 'Malformed UTF-8 characters, possibly incorrectly encoded';
        }

        switch ($lastError) {
            case JSON_ERROR_DEPTH:
                return 'Maximum stack depth exceeded';
                break;
            case JSON_ERROR_STATE_MISMATCH:
                return 'Underflow or the modes mismatch';
                break;
            case JSON_ERROR_CTRL_CHAR:
                return 'Unexpected control character found';
                break;
            case JSON_ERROR_SYNTAX:
                return 'Syntax error, malformed JSON';
                break;
            default:
                return 'Unknown';
                break;
        }
    }


    /**
     * Get last JSON error code
     * @return int|null
     */
    public function getLastJsonErrorCode()
    {
        // For PHP < 5.3, just return the PEST code for unknown errors
        if (!function_exists('json_last_error')) {
            return self::JSON_ERROR_UNKNOWN;
        }

        return json_last_error();
    }

    /**
     * Check if decoding failed
     * @return bool
     */
    private function hasJsonDecodeFailed()
    {
        // you cannot safely determine decode errors in PHP < 5.3
        if (!function_exists('json_last_error')) {
            return false;
        }

        return json_last_error() !== JSON_ERROR_NONE;
    }

    /**
     * Process body
     * @param string $body
     * @return mixed|string
     */
    public function processBody($body)
    {
        return $this->jsonDecode($body);
    }

    /**
     * Prepare request
     *
     * @param array $opts
     * @param string $url
     * @return resource
     */
    protected function prepRequest($opts, $url)
    {
        $opts[CURLOPT_HTTPHEADER][] = 'Accept: application/json';
        $opts[CURLOPT_HTTPHEADER][] = 'Content-Type: application/json';
        return parent::prepRequest($opts, $url);
    }
}

// JSON Errors
/* decode */
class SF_Pest_Json_Decode extends SF_Pest_ClientError
{}

/* encode */
class SF_Pest_Json_Encode extends SF_Pest_ClientError
{}
