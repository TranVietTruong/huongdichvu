<?php 
class UserController extends Controller
{
    /**
     * summary
     */

    public function __construct($param = NULL)
    {
        parent::__construct();

        $this->view->js = '<script src="resources/js/user.js"></script>';
    }

    public function user()
    {
        
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/user/banner');
        $this->view->Render('client/user/user');
        $this->view->Render('client/footer');
    }

}
