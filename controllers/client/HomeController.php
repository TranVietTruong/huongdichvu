<?php 
class HomeController extends Controller
{
    /**
     * summary
     */
    public $CatagoryModel;
    public $SloganModel;
    public $UserModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

        include 'models/CatagoryModel.php';
        include 'models/SloganModel.php';
        include 'models/UserModel.php';

        $this->CatagoryModel = new CatagoryModel();
        $this->SloganModel = new SloganModel();
        $this->UserModel = new UserModel();
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

        if(isset($_SESSION['verify_email']) && $_SESSION['verify_email'] == 'verified')
        {
            echo "<script>
                Swal.fire({
                    type: 'success',
                    text: 'Tài khoản đã được xác nhận',
                })
            </script>";
            unset($_SESSION['verify_email']);
        }
    }

    public function verify_email()
    {
        if(isset($_GET['code_email']))
        {
            $user = $this->UserModel->where('code_email',$_GET['code_email']);
            if(count($user) == 1)
            {
                $_SESSION['verify_email'] = 'verified';
                $this->UserModel->verify_email($_GET['code_email']);
                header('location:/');
            }
            else
            {
                header('location:/404');
            }
        }
        else
        {
            header('location:/404');
        }
    }

}
