<?php 
class LoginController extends Controller
{
    /**
     * summary
     */

    public function __construct($param = NULL)
    {
        parent::__construct();
        $this->view->js = '<script src="resources/js/login.js"></script>';
    }

    public function login()
    {
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/login/banner');
        $this->view->Render('client/login/login');
        $this->view->Render('client/footer');
    }

}
