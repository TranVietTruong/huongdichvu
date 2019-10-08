<?php 

require 'vendor/Simple_HTML_Dom/simple_html_dom.php'; 

class DetailNewsController extends Controller
{
    /**
     * summary
     */
    public $NewsModel;
    public $UserModel;
    public $CatagoryModel;


    public function __construct($param = NULL)
    {
        parent::__construct();
        include 'models/NewsModel.php';
        include 'models/UserModel.php';
        include 'models/CatagoryModel.php';

        $this->CatagoryModel = new CatagoryModel();
        $this->NewsModel = new NewsModel();
        $this->UserModel = new UserModel();

        $this->view->js = '<script src="resources/js/detail_news.js"></script>';
    }

    public function detail_news()
    {

        $url = $_SERVER['REQUEST_URI'];
        $url = explode('/', $url);
        $slug = $url[count($url)-1];
        $news = $this->NewsModel->find($slug);

        if(empty($news))
        {
            header('location:/404');
        }
        $this->view->title = $news[0]['title'];

        $this->view->url = $news[0]['content'];
        $this->view->post = $news[0]['post_by'];
        $this->view->news = $news;



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
        $this->view->catagories = $this->CatagoryModel->all();
        $this->view->name_banner = 'Tin Tức';
        
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/banner');
        $this->view->Render('client/detail_news/detail_news');
        $this->view->Render('client/news/option');
        $this->view->Render('client/footer');

        echo "<script>
                jQuery(document).ready(function($) {
                    $('.entry-footer').remove();
                    $('.single-widget').remove();
                });
            </script>";
    }
}
