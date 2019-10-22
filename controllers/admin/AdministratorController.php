<?php
class AdministratorController extends Controller
{
    /**
     * summary
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
        $this->view->js = '<script src="resources/js/admin/administrator.js"></script>';
    }

    public function administrator()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/administrator/administrator');
        $this->view->Render('admin/footer');
    }

    public function add()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/administrator/addAdmin');
        $this->view->Render('admin/footer');
    }

}
