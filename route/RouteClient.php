<?php
// ==================================== ERROR 404 =================================================
Route::add('/404',function(){
    Load::Controller('controllers/error/Error404Controller.php','Error404Controller','error404');
},'get');
// ====================================== END ====================================================

Route::add('/',function(){
	Load::Controller('controllers/client/HomeController.php','HomeController','home');
},'get');

Route::add('/test',function(){
	Load::Controller('controllers/client/HomeController.php','HomeController','test');
},'get');


Route::add('/linh-vuc/([a-z0-9\-]+$)',function(){
	Load::Controller('controllers/client/CategoryController.php','CategoryController','cate');
},'get');

Route::add('/dang-nhap',function(){
	if(isset($_SESSION['user']))
	{
		header('location:/404');
	}
	Load::Controller('controllers/client/LoginController.php','LoginController','login');
},'get');

Route::add('/dang-xuat',function(){
	if(!isset($_SESSION['user']))
	{
		header('location:/404');
	}
	Load::Controller('controllers/api/AuthController.php','AuthController','logout_user');
},'get');



Route::add('/dang-ky',function(){
	if(isset($_SESSION['user']))
	{
		header('location:/404');
	}
	Load::Controller('controllers/client/RegisterController.php','RegisterController','register');
},'get');

Route::add('/cau-hoi',function(){
	Load::Controller('controllers/client/QuestionController.php','QuestionController','question');
},'get');

Route::add('/dat-cau-hoi',function(){
	if(!isset($_SESSION['user']))
	{
		header('location:/404');
	}
	Load::Controller('controllers/client/PostQuestionController.php','PostQuestionController','post_question');
},'get');

Route::add('/cau-hoi/([a-z0-9\-]+$)',function(){
	Load::Controller('controllers/client/DetailQuestionController.php','DetaiQuestionController','detail_question');
},'get');

Route::add('/tin-tuc',function(){
	Load::Controller('controllers/client/NewsController.php','NewsController','news');
},'get');

Route::add('/tin-tuc/([A-Za-z0-9\-]+$)',function(){
	Load::Controller('controllers/client/DetailNewsController.php','DetailNewsController','detail_news');
},'get');


Route::add('/lien-he',function(){
	Load::Controller('controllers/client/ContactController.php','ContactController','contact');
},'get');

Route::add('/gioi-thieu',function(){
	Load::Controller('controllers/client/ContactController.php','ContactController','about');
},'get');

Route::add('/user',function(){
	if(!isset($_SESSION['user']))
	{
		header('location:/404');
	}
	Load::Controller('controllers/client/UserController.php','UserController','user');
},'get');

Route::add('/tim-kiem/cau-hoi',function(){
	Load::Controller('controllers/client/SearchController.php','SearchController','question');
},'get');

Route::add('/tim-kiem/tin-tuc',function(){
	Load::Controller('controllers/client/SearchController.php','SearchController','news');
},'get');




Route::add('/verify-email',function(){
	Load::Controller('controllers/client/HomeController.php','HomeController','verify_email');
},'get');

Route::add('/forget-password',function(){
	if(isset($_SESSION['user']))
	{
		header('location:/404');
	}
	Load::Controller('controllers/client/HomeController.php','HomeController','verify_forget_password');
},'get');


Route::add('/get_captcha',function(){
	Load::Controller('controllers/api/QuestionController.php','QuestionController','get_captcha');
},'get');

