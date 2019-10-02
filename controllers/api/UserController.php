<?php
class UserController extends Controller
{
    /**
     * summary
     */
    public $UserModel;
    public $TagModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

       	include 'models/UserModel.php';
        include 'models/TagModel.php';

        $this->UserModel = new UserModel();
        $this->TagModel = new TagModel();
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
 }