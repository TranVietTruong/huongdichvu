<?php 
class RegisterController extends Controller
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

        $this->view->js = '<script src="resources/js/register.js"></script>';
    }

    public function register()
    {
        $this->view->name_banner = 'Đăng Ký';
        $this->view->title = 'Đăng ký - Tư Vấn Khởi Nghiệp';
        $this->view->catagories = $this->CatagoryModel->all();
        
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/banner');
        $this->view->Render('client/register/register');
        $this->view->Render('client/footer');
    }

}
