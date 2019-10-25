<?php
require 'vendor/autoload.php';
use Phpml\Classification\KNearestNeighbors;
use Phpml\Classification\NaiveBayes;
use Phpml\Regression\LeastSquares;

class DetailQuestionController extends Controller
{
    /**
     * summary
     */
    public $AnswerModel;
    public $QuestionModel;
    public $VoteQuestionModel;
    public $VoteAnswerModel;
    public $TagModel;
    public $CatagoryModel;

    public function __construct($param = NULL)
    {
        parent::__construct();
        
        include 'models/AnswerModel.php';
        include 'models/QuestionModel.php';
        include 'models/VoteQuestionModel.php';
        include 'models/VoteAnswerModel.php';
        include 'models/TagModel.php';
        include 'models/CatagoryModel.php';

        $this->QuestionModel = new QuestionModel();
        $this->AnswerModel = new AnswerModel();
        $this->VoteQuestionModel = new VoteQuestionModel();
        $this->VoteAnswerModel = new VoteAnswerModel();
        $this->TagModel = new TagModel();
        $this->CatagoryModel = new CatagoryModel();
    }

    public function detail_question()
    {
        if(isset($_POST['slug']))
            $slug = $_POST['slug'];
        else
            http_response_code(500);

        $question = $this->QuestionModel->find($slug);

        if(isset($_SESSION['user']))
            $id_user = $_SESSION['user']['id'];
        else
            $id_user = -1;

        $vote_question = $this->VoteQuestionModel->where($id_user,$question[0]['id']);

        if(!empty($vote_question))
        {
            $question[0]['voted'] = true;
        }
        else
        {
            $question[0]['voted'] = false;
        }

        if(!empty($question))
            echo json_encode($question,JSON_UNESCAPED_UNICODE);
        else
            http_response_code(500);
    }

    public function get_all_answer_by_id_question()
    {
        if(isset($_POST['slug']))
            $slug = $_POST['slug'];
        else
            http_response_code(500);

        $question = $this->QuestionModel->find($slug);

        if(!empty($question))
        {
            $answers = $this->AnswerModel->findByIdQuestion($question[0]['id']);

            if(isset($_SESSION['user']))
                $id_user = $_SESSION['user']['id'];
            else
                $id_user = -1;

            $i = 0;
            foreach ($answers as $answer) {
                $vote_answer = $this->VoteAnswerModel->where($id_user,$answer['id']);
                
                if(count($vote_answer) == 1)
                {
                    $answers[$i]['voted'] = true;
                }
                else
                {
                    $answers[$i]['voted'] = false;
                }
                $i++;
            }



            echo json_encode($answers,JSON_UNESCAPED_UNICODE);
           
        }
        else
            http_response_code(500);
    }


    public function add_answer()
    {
        try
        {
            if(!isset($_SESSION['user']))
                throw new Exception('Bạn phải đăng nhập để sử dụng chức năng này',401);

            if(isset($_POST['id_question']))
                $id_question = $_POST['id_question'];
            else
                http_response_code(500);

            if(isset($_POST['content']))
                $content = $_POST['content'];
            else
                http_response_code(500);

            if(isset($_POST['content_text']))
                $content_text = $_POST['content_text'];
            else
                http_response_code(500);

            if(isset($_POST['tag']))
                $tag = $_POST['tag'];
            else
                http_response_code(500);

            $id = $this->AnswerModel->add($id_question,$_SESSION['user']['id'],$content,$content_text,$tag);

            $data = $this->AnswerModel->find($id);

            echo json_encode($data,JSON_UNESCAPED_UNICODE);
        }
        catch(Exception $e)
        {
            echo $e->getMessage();
            http_response_code(401);
        }
        
    }

    public function update_view()
    {
    
        if(isset($_POST['id']))
            $id = $_POST['id'];
        else
            http_response_code(500);

        $sessionKey = 'viewed_'.$id;
        $sessionView = $_SESSION[$sessionKey]; // lần đầu vào session của bài viết đang rỗng
        if(!$sessionView)
        {
            $_SESSION[$sessionKey] = 1;
            $this->QuestionModel->update_view($id);
        }
        else
            echo 'viewed';
    }

    public function vote()
    {
        if(!isset($_SESSION['user']))
        {
            http_response_code(401);
            echo 'Bạn phải đăng nhập để sử dụng chức năng này';
        }
        else
        {
            if(isset($_POST['id_question']))
                $id_question = $_POST['id_question'];
            else
                http_response_code(500);

            if(isset($_POST['action']))
                $action = $_POST['action'];
            else
                http_response_code(500);

            switch ($action) {
                case 'vote':
                    $this->VoteQuestionModel->add($_SESSION['user']['id'],$id_question);
                    echo 'voted';
                    break;
                case 'disvote':
                    $this->VoteQuestionModel->delete($_SESSION['user']['id'],$id_question);
                    echo 'disvoted';
                    break;
                default:
                    break;
            }
        }      
    }


    public function vote_answer()
    {
        if(!isset($_SESSION['user']))
        {
            http_response_code(401);
            echo 'Bạn phải đăng nhập để sử dụng chức năng này';
        }
        else
        {
            if(isset($_POST['id_answer']))
                $id_answer = $_POST['id_answer'];
            else
                http_response_code(500);

            if(isset($_POST['action']))
                $action = $_POST['action'];
            else
                http_response_code(500);

            switch ($action) {
                case 'vote':
                    $this->VoteAnswerModel->add($_SESSION['user']['id'],$id_answer);
                    echo 'voted';
                    break;
                case 'disvote':
                    $this->VoteAnswerModel->delete($_SESSION['user']['id'],$id_answer);
                    echo 'disvoted';
                    break;
                default:
                    break;
            }
        }
    }



    public function de_xuat_cau_tra_loi()
    {

        if(isset($_POST['slug']))
            $slug = $_POST['slug'];
        else
            http_response_code(500);

        $question = $this->QuestionModel->find($slug);

        if(count($question) == 0)
            http_response_code(404);

        $answer_question = $this->AnswerModel->findByIdQuestion($question[0]['id']);
        // nếu câu hỏi này chưa có câu trả lời thì cho máy đề xuất trả lời
        if(count($answer_question) == 0)
        {
            $tags = $this->TagModel->all();
            $answers = $this->AnswerModel->all();

            $i = 0;
            $samples = [];
            $targets = [];

            foreach ($answers as $answer) 
            {   
                $answers[$i]['label'] = 0;

                foreach ($tags as $tag) {
                    $num = substr_count(mb_strtolower($answer['title'],'UTF-8'),$tag['name']);
                    if($num > 0)
                        $answers[$i]['label'] += $num*$tag['id'];
                }

                array_push($samples,[ $answers[$i]['label'] ]);
                array_push($targets,$answer['id']);

                $i++;
            }

            $regression = new NaiveBayes();
            $regression->train($samples, $targets);


            $target = 0;
            foreach ($tags as $tag) {
                $num = substr_count(mb_strtolower($question[0]['title'],'UTF-8'),$tag['name']);
                if($num > 0)
                    $target += $num*$tag['id'];
                
            }

            $result = $regression->predict([ $target ]);
            // echo "<pre>";
            // echo $result;
            // var_dump([$target ]);
            // echo "--------------------";
            // var_dump($samples);
            // echo "----------------------";
            // var_dump($targets);

            $data = $this->AnswerModel->find($result);
    
            if(isset($_SESSION['user']))
                $id_user = $_SESSION['user']['id'];
            else
                $id_user = -1;

            $i = 0;
            foreach ($data as $value) 
            {
                $vote_answer = $this->VoteAnswerModel->where($id_user,$value['id']);
                
                if(count($vote_answer) == 1)
                {
                    $data[$i]['voted'] = true;
                }
                else
                {
                    $data[$i]['voted'] = false;
                }
                $i++;
            }

            echo json_encode($data,JSON_UNESCAPED_UNICODE);
        }
    }

}