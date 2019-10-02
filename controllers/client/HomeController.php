<?php 
class HomeController extends Controller
{
    /**
     * summary
     */
    public $CatagoryModel;
    public $SloganModel;
    public $UserModel;
    public $QuestionModel;
    public $NewsModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

        include 'models/CatagoryModel.php';
        include 'models/SloganModel.php';
        include 'models/UserModel.php';
        include 'models/QuestionModel.php';
        include 'models/NewsModel.php';

        $this->CatagoryModel = new CatagoryModel();
        $this->SloganModel = new SloganModel();
        $this->UserModel = new UserModel();
        $this->QuestionModel = new QuestionModel();
        $this->NewsModel = new NewsModel(); 
    }

    public function home()
    {
        $this->view->catagories = $this->CatagoryModel->all();
        $this->view->slogans = $this->SloganModel->all();

        if(isset($_SESSION['user']))
        {
            $user = $this->UserModel->find($_SESSION['user']['id']);
            if(!empty($user[0]['tag']))
            {
                $tag_user = explode(',',$user[0]['tag']);

                foreach ($tag_user as $value) 
                {
                    if(count($tag_user) > 5)
                        array_shift($tag_user);
                    else
                        break;
                }

                $data = [];
                $tintuc = [];

                foreach ($tag_user as $value) 
                {
                    $results = $this->QuestionModel->find_by_tag($value);

                    foreach ($results as $result) 
                    {
                        if(!in_array($result,$data))
                            array_push($data,$result);
                    }

                    $news = $this->NewsModel->find_by_tag($value);

                    foreach ($news as $new) 
                    {
                        if(!in_array($new,$tintuc))
                            array_push($tintuc,$new);
                    }
                }

                if(count($data) != 0)
                {
                    foreach ($data as $value) {
                        if(count($data) > 5)
                            array_pop($data);
                        else
                            break;
                    }
                    $this->view->questions = $data;
                }
                else
                    $this->view->questions = $this->QuestionModel->order_by_time_and_count_reply();

                if(count($tintuc) != 0)
                {
                    foreach ($tintuc as $value) {
                        if(count($tintuc) > 6)
                            array_pop($tintuc);
                        else
                            break;
                    }
                    $this->view->news = $tintuc;
                }
                else
                    $this->view->news = $this->NewsModel->rand();
            }
            else
            {   
                $this->view->questions = $this->QuestionModel->order_by_time_and_count_reply();
                $this->view->news = $this->NewsModel->rand();
            }
        }
        else
        {
            $this->view->questions = $this->QuestionModel->order_by_time_and_count_reply();
            $this->view->news = $this->NewsModel->rand();
        }

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
