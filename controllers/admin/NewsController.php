<?php
class NewsController extends Controller
{
    /**
     * summary
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
        $this->view->js = '<script src="resources/js/admin/news.js"></script>';
    }

    public function news()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/news/news');
        $this->view->Render('admin/footer');
    }

    public function addNews()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/news/addNews');
        $this->view->Render('admin/footer');
    }

}
