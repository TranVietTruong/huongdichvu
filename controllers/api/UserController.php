<?php
class UserController extends Controller
{
    /**
     * summary
     */
    public $UserModel;
    public $TagModel;
    public $QuestionModel;
    public $AnswerModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

       	include 'models/UserModel.php';
        include 'models/TagModel.php';
        include 'models/QuestionModel.php';
        include 'models/AnswerModel.php';

        $this->UserModel = new UserModel();
        $this->TagModel = new TagModel();
        $this->QuestionModel = new QuestionModel();
        $this->AnswerModel = new AnswerModel();
    }

    public function get_tag()
    {
        if(isset($_SESSION['user']))
        {
            $user = $this->UserModel->where('id',$_SESSION['user']['id']);
            $tag_user = explode(',', $user[0]['tag']);
            if(count($tag_user) > 1)
            {  
                if($tag_user[0] == '')
                    array_shift($tag_user);

                $data = [];
                foreach ($tag_user as $value) {
                    $result = $this->TagModel->find_by_name($value);
                    if(!empty($result))
                        array_push($data,$result[0]);
                }
                echo json_encode($data,JSON_UNESCAPED_UNICODE);
            }
            else 
            {
                $data = $this->TagModel->get_random_tag();
                echo json_encode($data,JSON_UNESCAPED_UNICODE);
            } 
        }
        else
        {
            $data = $this->TagModel->get_random_tag();
            echo json_encode($data,JSON_UNESCAPED_UNICODE);
        }	
    }

    public function get_question()
    {
        if(isset($_SESSION['user']))
        {
            $data = $this->QuestionModel->find_by_user($_SESSION['user']['id']);
            $i = 0;
            foreach ($data as $question) 
            {
                $tags = explode(',',$question['tag']);
                $tag_user = [];
                foreach ($tags as $tag) {
                    array_push($tag_user,['name'=> $tag]);
                }
                $data[$i]['tags'] = $tag_user;
                $i++;
            }
            echo json_encode($data,JSON_UNESCAPED_UNICODE);
        }
       
    }

    public function get_answer()
    {
        if(isset($_SESSION['user']))
        {
            $data = $this->AnswerModel->find_by_id_user($_SESSION['user']['id']);
            echo json_encode($data,JSON_UNESCAPED_UNICODE);
        }
        
    }
 }