<?php 
class QuestionController extends Controller
{
    /**
     * summary
     */
    public $CatagoryModel;
    public $QuestionModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

        include 'models/CatagoryModel.php';
        include 'models/QuestionModel.php';

        $this->CatagoryModel = new CatagoryModel();
        $this->QuestionModel = new QuestionModel();

        $this->view->js = '<script src="resources/js/list_question.js"></script>';
    }

    public function question()
    {
        $this->view->catagories = $this->CatagoryModel->all();
        $this->view->questions = $this->QuestionModel->all();

        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/question/banner');
        $this->view->Render('client/question/question');
        $this->view->Render('client/question/option');
        $this->view->Render('client/footer');
    }

}
