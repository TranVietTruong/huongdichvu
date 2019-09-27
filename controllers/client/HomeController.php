<?php 
class HomeController extends Controller
{
    /**
     * summary
     */
    public $CatagoryModel;
    public $SloganModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

        include 'models/CatagoryModel.php';
        include 'models/SloganModel.php';

        $this->CatagoryModel = new CatagoryModel();
        $this->SloganModel = new SloganModel();
    }

    public function home()
    {
        $this->view->catagories = $this->CatagoryModel->all();
        $this->view->slogans = $this->SloganModel->all();

        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/home/banner');
        $this->view->Render('client/home/feature');
        $this->view->Render('client/home/slogan');
        $this->view->Render('client/home/catagory');
        $this->view->Render('client/home/question');
        $this->view->Render('client/home/news');
        $this->view->Render('client/footer');
    }

    public function login()
    {
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/login/banner');
        $this->view->Render('client/login/login');
        $this->view->Render('client/footer');
    }

    public function register()
    {
        $this->view->catagories = $this->CatagoryModel->all();
        
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/register/banner');
        $this->view->Render('client/register/register');
        $this->view->Render('client/footer');
    }

}
