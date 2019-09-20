<?php 

class AuthController extends Controller
{
    /**
     * summary
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
        include 'models/api/AuthModel.php';
    }


    public function auth()
    {
        if(isset($_POST['username']))
            $username = $_POST['username'];
        else
        {
            http_response_code(500);
            echo 'Dữ liệu không hợp lệ';
        }

        if(isset($_POST['password']))
            $password = $_POST['password'];
        else
        {
            http_response_code(500);
            echo 'Dữ liệu không hợp lệ';
        }
        $auth = new AuthModel();
        $data = $auth->attempt($username,$password);
        if(count($data) > 0)
        {
            if($username == $data[0]['username'] && $password == $data[0]['password'])
            {
                unset($data[0]['password']);
                $_SESSION['admin'] = $data[0];
                echo json_encode($data);
            }
            else
            {
                http_response_code(401);
                echo 'Tên tài khoản hoặc mật khẩu không chính xác';
            }
        }
        else
        {
            http_response_code(401);
            echo 'Tên tài khoản hoặc mật khẩu không chính xác';
        }
        
    }

    public function logout()
    {
        if(isset($_SESSION['admin']))
            unset($_SESSION['admin']);
    }

    

}