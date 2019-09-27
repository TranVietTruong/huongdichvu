<?php
Route::add('/',function(){
	Load::Controller('controllers/client/HomeController.php','HomeController','home');
},'get');

Route::add('/dang-nhap',function(){
	Load::Controller('controllers/client/LoginController.php','LoginController','login');
},'get');

Route::add('/dang-ky',function(){
	Load::Controller('controllers/client/RegisterController.php','RegisterController','register');
},'get');

Route::add('/cau-hoi',function(){
	Load::Controller('controllers/client/QuestionController.php','QuestionController','question');
},'get');

Route::add('/chi-tiet-cau-hoi',function(){
	Load::Controller('controllers/client/DetailQuestionController.php','DetaiQuestionController','detail_question');
},'get');

Route::add('/lien-he',function(){
	Load::Controller('controllers/client/ContactController.php','ContactController','contact');
},'get');