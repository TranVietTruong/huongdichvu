<?php 
class QuestionController extends Controller
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
    }

    public function question()
    {
        $this->view->catagories = $this->CatagoryModel->all();

        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/question/banner');
        $this->view->Render('client/question/question');
        $this->view->Render('client/question/option');
        $this->view->Render('client/footer');
    }

}
