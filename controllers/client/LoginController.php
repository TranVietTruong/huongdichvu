<?php 
class LoginController extends Controller
{
    /**
     * summary
     */

    public function __construct($param = NULL)
    {
        parent::__construct();

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
