<?php 
class CatagoryController extends Controller
{
    /**
     * summary
     */
    
    public function __construct($param = NULL)
    {
        parent::__construct();
        $this->view->js = '<script src="resources/js/catagory.js"></script>';
    }

    public function catagory()
    {

        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/catagory/catagory');
        $this->view->Render('admin/footer');
    }

    public function addCatagory()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/catagory/addCatagory');
        $this->view->Render('admin/footer');
    }

    public function editCatagory()
    {
        $this->view->Render('admin/head');
        $this->view->Render('admin/header');
        $this->view->Render('admin/menu');
        $this->view->Render('admin/catagory/editCatagory');
        $this->view->Render('admin/footer');
    }

}
