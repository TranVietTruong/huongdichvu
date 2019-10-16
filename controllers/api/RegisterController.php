<?php
	use PHPMailer\PHPMailer\PHPMailer;
	use PHPMailer\PHPMailer\Exception;

	require 'vendor/PHPMailer/src/Exception.php';
	require 'vendor/PHPMailer/src/PHPMailer.php';
	require 'vendor/PHPMailer/src/SMTP.php'; 

class RegisterController extends Controller
{
    /**
     * summary
     */
   	public  $UserModel;

    public function __construct($param = NULL)
    {
        parent::__construct();
        include 'models/UserModel.php';
        $this->UserModel = new UserModel();
    }

    public function register()
    {
    	try {
    		if(isset($_POST['captcha']))
    		{
    			$secret = '6LcSgb0UAAAAAIFY3J1gQYnjrTFNs9AeYpfTkCdd';
    			$verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$secret.'&response='.$_POST['captcha']);
    			$responseData = json_decode($verifyResponse);
    			if($responseData->success)
    			{
    				$succMsg = 'Your contact request have submitted successfully.';
    			}
    			else
    			{
    				throw new Exception('Nhập captcha');
    			}
    		}
    		else
    		{
    			throw new Exception('Nhập captcha');
    		}




	    	if(isset($_POST['full_name']))
	    		$full_name = $_POST['full_name'];
	    	else
	    		http_response_code(500);

	    	if(isset($_POST['email']))
	    		$email = $_POST['email'];
	    	else
	    		http_response_code(500);

	    	if(isset($_POST['username']))
	    		$username = $_POST['username'];
	    	else
	    		http_response_code(500);

	    	if(isset($_POST['password']))
	    		$password = password_hash($_POST['password'],PASSWORD_BCRYPT);
	    	else
	    		http_response_code(500);

	    	$checkEmail = $this->UserModel->where('email',$email);
	    	if(count($checkEmail) > 0)
	    	{
	    		throw new Exception('Email đã tồn tại');
	    	}

	    	$checkUsername = $this->UserModel->where('username',$username);
	    	if(count($checkUsername) > 0)
	    	{
	    		throw new Exception('Tên đăng nhập đã tồn tại');
	    	}



	    	$code_email = mt_rand(100000,999999);
	    	$url = 'http://huongdichvu.com:8888/verify-email?code_email='.$code_email;

	    	$this->view->Render('email/register');

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
		    $mail->addAddress($email, 'User');     // Add a recipient

		    // Attachments
		    //$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
		    //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

		    // Content
		    $mail->isHTML(true);                                  // Set email format to HTML
		    $mail->Subject = 'THƯ XÁC NHẬN TÀI KHOẢN';
		    $mail->Body    = verify($url);
		    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

		    if($mail->send())
		    {
		    	$this->UserModel->register($full_name,$email,$username,$password,$code_email);
		    }
		} 
		catch (Exception $e) {
		   	http_response_code(401);
		   	echo json_encode($e->getMessage(),JSON_UNESCAPED_UNICODE);
		}
    }


}
