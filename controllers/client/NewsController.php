<?php 

class NewsController extends Controller
{
    /**
     * summary
     */
    public $NewsModel;
    public $UserModel;
    public $CattagoryModel;

    public function __construct($param = NULL)
    {
        parent::__construct();
        include 'models/NewsModel.php';
        include 'models/UserModel.php';
        include 'models/CatagoryModel.php';

        $this->NewsModel = new NewsModel();
        $this->UserModel = new UserModel();
        $this->CatagoryModel = new CatagoryModel();

        $this->view->js = '<script src="resources/js/news.js"></script>';
    }

    public function news()
    { 
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
                    $news = $this->NewsModel->find_by_tag($value);
                    foreach ($news as $new) 
                    {
                        if(!in_array($new,$tintuc))
                            array_push($tintuc,$new);
                    }
                }

                if(count($tintuc) != 0)
                {
                    foreach ($tintuc as $value) {
                        if(count($tintuc) > 6)
                            //array_pop($tintuc);
                            array_splice($tintuc,rand(0,count($tintuc)),1);
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
                $this->view->news = $this->NewsModel->rand();
            }
        }
        else
        {
            $this->view->news = $this->NewsModel->rand();
        }

        $this->view->newsTop5 = $this->NewsModel->top5();
        $this->view->name_banner = 'Tin Tức';
        $this->view->title = "Tin tức";
        $this->view->catagories = $this->CatagoryModel->all();

        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/banner');
        $this->view->Render('client/news/news');
        $this->view->Render('client/news/option');
        $this->view->Render('client/footer');
    }
}
