<?php 
class DetaiQuestionController extends Controller
{
    /**
     * summary
     */
    public $CatagoryModel;
    public $QuestionModel;
    //public $VoteQuestionModel;

    public function __construct($param = NULL)
    {
        parent::__construct();
        
        include 'models/CatagoryModel.php';
        //include 'models/VoteQuestionModel.php';
        include 'models/QuestionModel.php';

        $this->CatagoryModel = new CatagoryModel();
        $this->QuestionModel = new QuestionModel();
        //$this->VoteQuestionModel = new VoteQuestionModel();

        $this->view->js = '<script src="resources/js/detail_question.js"></script>';
    }

    public function detail_question()
    {
       
        $this->view->catagories = $this->CatagoryModel->all();
        
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/detail_question/banner');
        $this->view->Render('client/detail_question/detail_question');
        $this->view->Render('client/detail_question/option');
        $this->view->Render('client/footer');

    }

}
