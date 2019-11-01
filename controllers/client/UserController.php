<?php 
class UserController extends Controller
{
    /**
     * summary
     */

    public $CatagoryModel;
    public function __construct($param = NULL)
    {
        parent::__construct();
        include 'models/QuestionModel.php';
        include 'models/CatagoryModel.php';
        
        $this->CatagoryModel = new CatagoryModel();
        $this->view->js = '<script src="resources/js/user.js"></script>';
    }

    public function user()
    {
        $this->view->title = $_SESSION['user']['full_name'].' - Tư Vấn Khởi Nghiệp';
        
        $this->view->catagories = $this->CatagoryModel->all();
        
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/user/banner');
        $this->view->Render('client/user/user');
        $this->view->Render('client/footer');
    }

}
