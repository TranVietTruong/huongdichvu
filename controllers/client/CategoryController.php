<?php
   require 'controllers/service/TimeAgo.php';
class CategoryController extends Controller
{
    /**
     * summary
     */
    public $CatagoryModel;
    public $QuestionModel;
    public $UserModel;
    public $NewsModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

        include 'models/CatagoryModel.php';
        include 'models/QuestionModel.php';
        include 'models/UserModel.php';
        include 'models/NewsModel.php';

        $this->CatagoryModel = new CatagoryModel();
        $this->QuestionModel = new QuestionModel();
        $this->UserModel = new UserModel();
        $this->NewsModel = new NewsModel();

        $this->view->js = '<script src="resources/js/category.js"></script>';
    }

    public function cate()
    {
        
        $this->view->title = 'Câu hỏi';

        $this->view->name_banner = 'Lĩnh Vực';

        $this->view->catagories = $this->CatagoryModel->all();

        // -------------- Lấy các câu hỏi phần CÓ THỂ BẠN BIẾT để hiển thị ------------------------

         $data = [];
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
                            //array_shift($data);
                            array_splice($data,rand(0,count($data)),1);
                        else
                            break;
                    }
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
        //---------------------------------------- END ------------------------------------------------
        
        //------------- THỜI GIAN ĐĂNG -----------------------------------
        $i = 0;
        foreach ($data as $value) {
            $data[$i]['time'] = TimeAgo::time_ago($value['created_at']);
            $i++;
        }
        //----------------------------------------------------------------

        $this->view->questions = $data;


        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/banner');
        $this->view->Render('client/category/category');
        $this->view->Render('client/question/option');
        $this->view->Render('client/footer');
    }


}