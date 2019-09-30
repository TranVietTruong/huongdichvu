<?php 

class AuthController extends Controller
{
    /**
     * summary
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
        include 'models/AuthModel.php';
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


    public function auth_user()
    {
        try {
            if(isset($_POST['username']))
                $username = $_POST['username'];
            else
                http_response_code(500);

            if(isset($_POST['password']))
                $password = $_POST['password'];
            else
                http_response_code(500);

            $auth = new AuthModel();
            $user = $auth->attempt_user($username);
         
            if(count($user) > 0)
            {
                if($username == $user[0]['username'] && password_verify($password,$user[0]['password']))
                {
                    if($user[0]['email_verified'] == 1)
                    {
                        if($user[0]['active'] == 1)
                        {
                            unset($user[0]['password']);
                            $_SESSION['user'] = $user[0];
                            echo json_encode($user,JSON_UNESCAPED_UNICODE);
                        }
                        else
                        {
                            throw new Exception('Tài khoản đã bị khóa',401);
                        }
                    }
                    else
                    {
                        throw new Exception('Tài khoản chưa xác thực',401);
                    }
                   
                }
                else
                {
                    throw new Exception('Tên tài khoản hoặc mật khẩu không chính xác',401);
                }
            }
            else
            {
                throw new Exception('Tên tài khoản hoặc mật khẩu không chính xác',401);
            }

        } catch (Exception $e) {
            http_response_code(401);
            echo $e->getMessage();
        }

    }

    public function logout_user()
    {
        if(isset($_SESSION['user']))
        {
            unset($_SESSION['user']);
            header('location:/');
        }
    }

}