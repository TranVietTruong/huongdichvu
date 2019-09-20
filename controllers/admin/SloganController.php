<?php 
class SloganController extends Controller
{
    /**
     * summary
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
        $this->view->js = '<script src="resources/js/slogan.js"></script>';
    }

    public function slogan()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/slogan/slogan');
        $this->view->Render('admin/footer');
    }

    public function addSlogan()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/slogan/addSlogan');
        $this->view->Render('admin/footer');
    }

    public function editSlogan()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/slogan/editSlogan');
        $this->view->Render('admin/footer');
    }

}
