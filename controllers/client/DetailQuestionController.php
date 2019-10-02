<?php 
class DetaiQuestionController extends Controller
{
    /**
     * summary
     */
    public $CatagoryModel;
    public $QuestionModel;
    public $VoteQuestionModel;
    public $UserModel;

    public function __construct($param = NULL)
    {
        parent::__construct();
        
        include 'models/CatagoryModel.php';
        include 'models/VoteQuestionModel.php';
        include 'models/QuestionModel.php';
        include 'models/UserModel.php';

        $this->CatagoryModel = new CatagoryModel();
        $this->QuestionModel = new QuestionModel();
        $this->VoteQuestionModel = new VoteQuestionModel();
        $this->UserModel = new UserModel();

        $this->view->js = '<script src="resources/js/detail_question.js"></script>';
    }

    public function detail_question()
    {

        $this->view->catagories = $this->CatagoryModel->all();

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
                foreach ($tag_user as $value) 
                {
                    $results = $this->QuestionModel->find_by_tag($value);
                    foreach ($results as $result) 
                    {
                        if(!in_array($result,$data))
                            array_push($data,$result);
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
            }
            else
            {
                $this->view->questions = $this->QuestionModel->order_by_time_and_count_reply();
            }
        }
        else
        {
            $this->view->questions = $this->QuestionModel->order_by_time_and_count_reply();
        }

        
        
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/detail_question/banner');
        $this->view->Render('client/detail_question/detail_question');
        $this->view->Render('client/detail_question/option');
        $this->view->Render('client/footer');

        

        if(isset($_SESSION['user']))
        {
            $url = $_SERVER['REQUEST_URI'];
            $url = explode('/', $url);
            $slug = $url[count($url)-1];
            $question = $this->QuestionModel->find($slug);

            $user = $this->UserModel->find($_SESSION['user']['id']);

            $tag_question = explode(',',$question[0]['tag']);

            $tag_user = explode(',',$user[0]['tag']);

            foreach ($tag_question as $value) 
            {
                if(!in_array($value,$tag_user))
                {
                    array_push($tag_user,$value);
                }
            }
            if(count($tag_user) > 10)
            {
                foreach ($tag_user as $value) {
                    if(count($tag_user) > 10)
                        array_shift($tag_user);
                    else
                        break;
                }
            }

            $tag_user = implode(',', $tag_user);
            $this->UserModel->update_tag($_SESSION['user']['id'],$tag_user);
        }

    }

}
