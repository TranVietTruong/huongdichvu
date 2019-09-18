<?php 

class AdminController extends Controller
{
    /**
     * summary
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
        include "models/test.php";
        $this->index($param);
    }

    public function index($param)
    {
        if(isset($param[0]))
        {
            switch ($param[0]) {
                case 'login':
                    $this->login();
                    break;
                case 'slogan':
                    $this->slogan();
                    break;
                default:
                    $this->error404();
                    break;
            }
        }
        else
        {
            $this->dasboard();
        }
    }

    public function dasboard()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/footer');
    }

    public function slogan()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/slogan/slogan');
        $this->view->Render('admin/footer');
    }

    public function error404()
    {
        $this->view->Render('admin/404');
    }

    public function login()
    {
        $this->view->Render('admin/login');
    }

}
