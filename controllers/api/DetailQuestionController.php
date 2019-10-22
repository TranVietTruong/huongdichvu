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

        $answer = $this->AnswerModel->findByIdQuestion($question[0]['id']);
        if(count($answer) == 0)
        {
           
            $cathe = $this->AnswerModel->choncathe();

            $k = 0;
            foreach ($cathe as $value) {
                $cathe[$k]['sucsong'] = 0;
                if($value['id_catagory'] == $question[0]['id_catagory'])
                    $cathe[$k]['sucsong'] += 3;

                $tag_answers = explode(',', $value['tag']);
               
                foreach ($tag_answers as $tag_answer) {
                    $result = substr_count($question[0]['title'],$tag_answer);
                    $cathe[$k]['sucsong'] += $result * 7;
                }

                $k++;
            }

            $tags = explode(',',$question[0]['tag']);
            foreach ($tags as $tag) {
                $i = 0;
                foreach ($cathe as $value) {
                    $solanxuathien = substr_count($value['content_text'],$tag);
                    $cathe[$i]['sucsong'] += $solanxuathien;

                    $solanxuathien_trongtitle = substr_count($value['title'],$tag);
                    $cathe[$i]['sucsong'] += $solanxuathien_trongtitle*10;

                    $i++;
                }
            }
            
            $j = 0;
            foreach ($cathe as $value) {
                if($value['sucsong'] < 7)
                    unset($cathe[$j]);
                $j++;
            }

            $data = array_values($cathe);


            if(isset($_SESSION['user']))
                $id_user = $_SESSION['user']['id'];
            else
                $id_user = -1;
        
            $i = 0;
            foreach ($data as $answer) {
                $vote_answer = $this->VoteAnswerModel->where($id_user,$answer['id']);
                
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