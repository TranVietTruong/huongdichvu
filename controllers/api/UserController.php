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
    public $AuthModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

       	include 'models/UserModel.php';
        include 'models/TagModel.php';
        include 'models/QuestionModel.php';
        include 'models/AnswerModel.php';
        include 'models/AuthModel.php';
       
        $this->UserModel = new UserModel();
        $this->TagModel = new TagModel();
        $this->QuestionModel = new QuestionModel();
        $this->AnswerModel = new AnswerModel();
        $this->AuthModel = new AuthModel();
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
                    {
                        if(!in_array($result[0],$data))
                            array_push($data,$result[0]);
                    }
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

    public function remove_question()
    {
        if(isset($_SESSION['user']))
        {
            if(isset($_POST['id']))
                $id = $_POST['id'];
            else
                http_response_code(500);

            $this->QuestionModel->delete($id);
        } 
    }

    public function remove_answer()
    {
        if(isset($_SESSION['user']))
        {
            if(isset($_POST['id']))
                $id = $_POST['id'];
            else
                http_response_code(500);

            $this->AnswerModel->delete($id);
        } 
    }

    public function update_name()
    {
        if(isset($_SESSION['user']))
        {
            if(isset($_POST['name']))
                $name = $_POST['name'];
            else
                http_response_code(500);

            $_SESSION['user']['full_name'] = $name;
            $this->UserModel->update_name($_SESSION['user']['id'],$name);

        } 
    }

    public function update_pass()
    {
        try {
            if(isset($_POST['pass']))
                $pass = $_POST['pass'];
            else
                http_response_code(500);

            if(isset($_POST['newpass']))
                $newpass = $_POST['newpass'];
            else
                http_response_code(500);

            $auth = new AuthModel();
            $user = $auth->attempt_user($_SESSION['user']['username']);
         
            if(count($user) > 0)
            {
                if(password_verify($pass,$user[0]['password']))
                {
                    $this->UserModel->update_password($_SESSION['user']['id'],password_hash($newpass, PASSWORD_BCRYPT));
                }
                else
                {
                    throw new Exception('Mật khẩu không chính xác',401);
                }
            }
            else
            {
                throw new Exception('Lỗi',401);
            }

        } catch (Exception $e) {
            http_response_code(401);
            echo $e->getMessage();
        }
    }
 }