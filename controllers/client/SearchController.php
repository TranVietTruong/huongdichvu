<?php
require 'controllers/service/TimeAgo.php';
class SearchController extends Controller
{
    /**
     * summary
     */

    /**
     * summary
     */
    public $CatagoryModel;
    public $QuestionModel;
    public $UserModel;
    public $NewsModel;
    public $SearchModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

        include 'models/CatagoryModel.php';
        include 'models/QuestionModel.php';
        include 'models/UserModel.php';
        include 'models/NewsModel.php';
        include 'models/SearchModel.php';

        $this->CatagoryModel = new CatagoryModel();
        $this->QuestionModel = new QuestionModel();
        $this->UserModel = new UserModel();
        $this->NewsModel = new NewsModel();
        $this->SearchModel = new SearchModel();

        $this->view->js = '<script src="resources/js/list_question.js"></script>';
    }

    public function question()
    {
        $this->view->name_banner = 'Tìm Kiếm';
        $this->view->title = 'Tìm kiếm câu hỏi';

        $this->view->catagories = $this->CatagoryModel->all();

        // -------------- Lấy các câu hỏi phần CÓ THỂ BẠN BIẾT để hiển thị ------------------------
        $data = [];
        $tintuc = [];
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
                            //array_shift($data);
                            array_splice($data,rand(0,count($data)),1);
                        else
                            break;
                    }
                    //$this->view->questions = $data;
                }
                else
                    $data = $this->QuestionModel->order_by_time_and_count_reply();

                if(count($tintuc) != 0)
                {
                    foreach ($tintuc as $value) {
                        if(count($tintuc) > 7)
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
                $data = $this->QuestionModel->order_by_time_and_count_reply();
                $this->view->news = $this->NewsModel->rand();
            }
        }
        else
        {
            $data = $this->QuestionModel->order_by_time_and_count_reply();
            $this->view->news = $this->NewsModel->rand();
        }

        //------------- THỜI GIAN ĐĂNG -----------------------------------
        $i = 0;
        foreach ($data as $value) {
            $data[$i]['time'] = TimeAgo::time_ago($value['created_at']);
            $i++;
        }
        //----------------------------------------------------------------

        $this->view->questions = $data;



        //---------------------------------------- END ------------------------------------------------
        
        if(isset($_GET['cate']))
            $cate = $_GET['cate'];
        else
            $cate = 'NULL';

        if(isset($_GET['key']))
            $keyword = $_GET['key'];
        else
            $keyword = null;


        $search_questions = [];

        if($cate == 'NULL')
        {

            $search_questions = $this->QuestionModel->search_no_cate($keyword);
            //------------- THỜI GIAN ĐĂNG -----------------------------------
            $i = 0;
            foreach ($search_questions as $value) {
                $search_questions[$i]['time'] = TimeAgo::time_ago($value['created_at']);
                $i++;
            }
            //----------------------------------------------------------------
            $this->view->search_questions = $search_questions;
        }
        else
        {
            $search_questions = $this->QuestionModel->search_cate($cate,$keyword);
            //------------- THỜI GIAN ĐĂNG -----------------------------------
            $i = 0;
            foreach ($search_questions as $value) {
                $search_questions[$i]['time'] = TimeAgo::time_ago($value['created_at']);
                $i++;
            }
            //----------------------------------------------------------------
            $this->view->search_questions = $search_questions;
        }

        $result = $this->SearchModel->where('keyword',$keyword);

        if(count($result) > 0)
        {
            if(count($search_questions) == 0 && $result[0]['total'] >= 1)
            {
                $search_questions = $this->QuestionModel->search_fulltext($keyword);
                //------------- THỜI GIAN ĐĂNG -----------------------------------
                $i = 0;
                foreach ($search_questions as $value) {
                    $search_questions[$i]['time'] = TimeAgo::time_ago($value['created_at']);
                    $i++;
                }
                //----------------------------------------------------------------
                $this->view->search_questions = $search_questions;
            }
        }
        
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/banner');
        $this->view->Render('client/search/search_question');
        $this->view->Render('client/question/option');
        $this->view->Render('client/footer');
  
        if($keyword != '')
        {
            $searchs = $this->SearchModel->all();
            $update = 0;
            $id = -1;

            if(count($result) > 0)
                $update = 1;
    
            if($update == 1)
            {
                $this->SearchModel->update($result[0]['id']);
            }
            else{
                $this->SearchModel->add($keyword,'question',$cate);
            }
        }
    }

    public function news()
    {
        $this->view->name_banner = 'Tìm Kiếm';
        $this->view->title = 'Tìm kiếm tin tức';
        $this->view->catagories = $this->CatagoryModel->all();

        // -------------- Lấy các câu hỏi phần CÓ THỂ BẠN BIẾT để hiển thị ------------------------
        $data = [];
        $tintuc = [];
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
                            //array_shift($data);
                            array_splice($data,rand(0,count($data)),1);
                        else
                            break;
                    }
                    //$this->view->questions = $data;
                }
                else
                    $data = $this->QuestionModel->order_by_time_and_count_reply();

                if(count($tintuc) != 0)
                {
                    foreach ($tintuc as $value) {
                        if(count($tintuc) > 7)
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
                $data = $this->QuestionModel->order_by_time_and_count_reply();
                $this->view->news = $this->NewsModel->rand();
            }
        }
        else
        {
            $data = $this->QuestionModel->order_by_time_and_count_reply();
            $this->view->news = $this->NewsModel->rand();
        }

        //------------- THỜI GIAN ĐĂNG -----------------------------------
        $i = 0;
        foreach ($data as $value) {
            $data[$i]['time'] = TimeAgo::time_ago($value['created_at']);
            $i++;
        }
        //----------------------------------------------------------------

        $this->view->questions = $data;
        //---------------------------------------- END ------------------------------------------------
        if(isset($_GET['key']))
            $keyword = $_GET['key'];
        else
            $keyword = NULL;

        $search_news = $this->NewsModel->like($keyword);
        $this->view->search_news = $search_news;
        
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/banner');
        $this->view->Render('client/search/search_news');
        $this->view->Render('client/question/option');
        $this->view->Render('client/footer');  

        if($keyword != '')
        {
            $searchs = $this->SearchModel->all();
            $update = 0;
            $id = -1;

            $result = $this->SearchModel->where('keyword',$keyword);
            if(count($result) > 0)
                $update = 1;
    
            if($update == 1)
            {
                $this->SearchModel->update($result[0]['id']);
            }
            else{
                $this->SearchModel->add($keyword,'news',$cate);
            }
        }  


    }

 }