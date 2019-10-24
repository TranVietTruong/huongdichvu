<?php 
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

    require 'vendor/PHPMailer/src/Exception.php';
    require 'vendor/PHPMailer/src/PHPMailer.php';
    require 'vendor/PHPMailer/src/SMTP.php'; 

    require 'controllers/service/TimeAgo.php';

    require 'vendor/autoload.php';

    use Phpml\Classification\KNearestNeighbors;

class HomeController extends Controller
{
    /**
     * summary
     */
    public $CatagoryModel;
    public $SloganModel;
    public $UserModel;
    public $QuestionModel;
    public $NewsModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

        include 'models/CatagoryModel.php';
        include 'models/SloganModel.php';
        include 'models/UserModel.php';
        include 'models/QuestionModel.php';
        include 'models/NewsModel.php';

        $this->CatagoryModel = new CatagoryModel();
        $this->SloganModel = new SloganModel();
        $this->UserModel = new UserModel();
        $this->QuestionModel = new QuestionModel();
        $this->NewsModel = new NewsModel(); 

        $this->view->js = '<script src="resources/js/home.js"></script>';
    }

    public function home()
    {
        $this->view->title = 'Trang chủ';

        $this->view->catagories = $this->CatagoryModel->all();
        $this->view->slogans = $this->SloganModel->all();

        if(isset($_SESSION['user']))
        {
            $user = $this->UserModel->find($_SESSION['user']['id']);
            $data = [];
            $tintuc = [];

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
                            //array_pop($data);
                            array_splice($data,rand(0,count($data)),1);
                        else
                            break;
                    }
                    //$this->view->questions = $data;
                }
                else
                    //$this->view->questions = $this->QuestionModel->order_by_time_and_count_reply();
                    $data = $this->QuestionModel->order_by_time_and_count_reply();

                if(count($tintuc) != 0)
                {
                    foreach ($tintuc as $value) {
                        if(count($tintuc) > 6)
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
        $this->view->Render('client/home/banner');
        $this->view->Render('client/home/feature');
        $this->view->Render('client/home/slogan');
        $this->view->Render('client/home/catagory');
        $this->view->Render('client/home/question');
        $this->view->Render('client/home/news');
        $this->view->Render('client/footer');

        if(isset($_SESSION['verify_email']) && $_SESSION['verify_email'] == 'verified')
        {
            echo "<script>
                Swal.fire({
                    type: 'success',
                    text: 'Tài khoản đã được xác nhận',
                })
            </script>";
            unset($_SESSION['verify_email']);
        }
    }

    public function verify_email()
    {
        if(isset($_GET['code_email']))
        {
            $user = $this->UserModel->where('code_email',$_GET['code_email']);
            if(count($user) == 1)
            {
                $_SESSION['verify_email'] = 'verified';
                $this->UserModel->verify_email($_GET['code_email']);
                header('location:/');
            }
            else
            {
                header('location:/404');
            }
        }
        else
        {
            header('location:/404');
        }
    }

    public function verify_forget_password()
    {
        if(isset($_GET['code_email']))
        {
            $code_email = $_GET['code_email'];
            $user = $this->UserModel->where('code_email',$code_email);
            if(count($user) > 0)
            {
                $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSWXYZ';
                $newpass = substr(str_shuffle($permitted_chars),0,6);

                $this->UserModel->update_password($user[0]['id'],password_hash($newpass,PASSWORD_BCRYPT));
                $this->UserModel->update_code($user[0]['email'],'');

                $this->view->Render('email/verify_password');

                $mail = new PHPMailer(true);

                //Server settings
                $mail->CharSet = "UTF-8"; 
                $mail->SMTPDebug = 0;                                       // Enable verbose debug output
                $mail->isSMTP();                                            // Set mailer to use SMTP
                $mail->Host       = 'smtp.gmail.com';  // Specify main and backup SMTP servers
                $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
                $mail->Username   = 'tranviettruong1998@gmail.com';                     // SMTP username
                $mail->Password   = '1141360217';                               // SMTP password
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption, `PHPMailer::ENCRYPTION_SMTPS` also accepted
                $mail->Port       = 587;                                    // TCP port to connect to

                //Recipients
                $mail->setFrom('tranviettruong1998@gmail.com', 'Tư Vấn Khởi Nghiệp');
                $mail->addAddress($user[0]['email'], 'User');     // Add a recipient

                // Attachments
                //$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
                //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

                // Content
                $mail->isHTML(true);                                  // Set email format to HTML
                $mail->Subject = 'THƯ CẤP LẠI MẬT KHẨU';
                $mail->Body    = verify_password($newpass);
                $mail->AltBody = 'Tư Vấn Khởi Nghiệp';

                $mail->send();
                $_SESSION['verify_password'] = 'verified';
                echo "<script>window.location.href = '/dang-nhap'</script>";
            }
            else
            {
                header('location:/404');
            }
        }
        else
        {
            header('location:/404');
        }
    }



    public function test()
    {
        $samples = [[1, 3], [1, 4], [2, 4], [3, 1], [4, 1], [4, 2]];
        $labels = ['a', 'a', 'a', 'b', 'b', 'b'];

        $classifier = new KNearestNeighbors();
        $classifier->train($samples, $labels);

        $resutl = $classifier->predict([3, 2]);
        echo $resutl;
    }
}
