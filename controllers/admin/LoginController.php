<?php 

class LoginController extends Controller
{
    /**
     * summarys
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
    }

    public function login()
    {
        $this->view->Render('admin/login');
    }

}
