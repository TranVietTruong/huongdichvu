<?php
Route::add('/',function(){
	Load::Controller('controllers/client/HomeController.php','HomeController','home');
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

Route::add('/verify-email',function(){
	Load::Controller('controllers/client/HomeController.php','HomeController','verify_email');
},'get');


