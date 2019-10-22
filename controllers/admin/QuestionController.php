<?php
class QuestionController extends Controller
{
    /**
     * summary
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
        $this->view->js = '<script src="resources/js/admin/administrator.js"></script>';
    }

    public function question()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/question/question');
        $this->view->Render('admin/footer');
    }

    public function detail()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/question/detail');
        $this->view->Render('admin/footer');
    }

}
