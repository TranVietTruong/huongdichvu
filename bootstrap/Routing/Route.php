<?php 
    class Router
    {
        public $_controller;
        public $_param;

        public function __construct($param = NULL)
        {
            $this->ParseUrl();
            $this->Load();
        }

        public function ParseUrl()
        {
    
            $url = isset($_GET['url']) ? $_GET['url'] : '';
            if($url != '')
            {
                $arr_url = explode('/',$url);
                $this->_controller = $arr_url[0];
                array_shift($arr_url);
                if(count($arr_url) > 0)
                {
                    $this->_param = array();
                    foreach ($arr_url as $value) 
                    {
                        if(trim($value) != "")
                        {
                            array_push($this->_param,$value);
                        }
                    }
                }
            }
            else
            {
                $this->_controller = "";
            }
        }

        public function Load()
        {
            $cName = ucfirst($this->_controller)."Controller";
            $path = "controllers/".$this->_controller.".php";
            
            if(file_exists($path))
            {
                include $path;
                new $cName($this->_param);
            }
            else
            {
                include "controllers/HomeController.php";
                new Homecontroller();
            }
        }
    }
