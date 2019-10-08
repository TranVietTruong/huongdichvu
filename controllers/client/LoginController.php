<?php 
class LoginController extends Controller
{
    /**
     * summary
     */
    public $CatagoryModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

        include 'models/CatagoryModel.php';
        $this->CatagoryModel = new CatagoryModel();

        $this->view->js = '<script src="resources/js/login.js"></script>';
    }

    public function login()
    {
        $this->view->name_banner = 'Đăng Nhập';
        $this->view->title = 'Đăng nhập';
        $this->view->catagories = $this->CatagoryModel->all();

        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/banner');
        $this->view->Render('client/login/login');
        $this->view->Render('client/footer');
    }

}
