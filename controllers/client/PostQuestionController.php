<?php 
class PostQuestionController extends Controller
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

        $this->view->js = '<script src="resources/js/post_question.js"></script>';
    }

    public function post_question()
    {
        $this->view->name_banner = "Đặt Câu Hỏi";
        $this->view->catagories = $this->CatagoryModel->all();

        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/banner');
        $this->view->Render('client/post_question/post_question');
        $this->view->Render('client/footer');
    }

}
