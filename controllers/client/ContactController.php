<?php 
class ContactController extends Controller
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

        $this->view->js = '<script src="resources/js/about.js"></script>';
    }

    public function contact()
    { 
        $this->view->name_banner = 'Liên Hệ';
        $this->view->catagories = $this->CatagoryModel->all();
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/banner');
        $this->view->Render('client/contact/contact');
        $this->view->Render('client/footer');
    }


    public function about()
    {
        $this->view->name_banner = 'Giới Thiệu';
        $this->view->catagories = $this->CatagoryModel->all();
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/banner');
        $this->view->Render('client/about/about');
        $this->view->Render('client/footer');
    }
}
