<?php


class DetailQuestionController extends Controller
{
    /**
     * summary
     */
    public $AnswerModel;
    public $QuestionModel;
    public $VoteQuestionModel;
    public $VoteAnswerModel;

    public function __construct($param = NULL)
    {
        parent::__construct();
        
        include 'models/AnswerModel.php';
        include 'models/QuestionModel.php';
        include 'models/VoteQuestionModel.php';
        include 'models/VoteAnswerModel.php';

        $this->QuestionModel = new QuestionModel();
        $this->AnswerModel = new AnswerModel();
        $this->VoteQuestionModel = new VoteQuestionModel();
        $this->VoteAnswerModel = new VoteAnswerModel();
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

        if(count($vote_question) == 1)
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

            if(isset($_POST['tag']))
                $tag = $_POST['tag'];
            else
                http_response_code(500);

            $id = $this->AnswerModel->add($id_question,$_SESSION['user']['id'],$content,$tag);

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

}