<?php
include 'bootstrap/Routing/Router.php';
include 'bootstrap/Routing/AutoLoad.php';

Route::add('/admin',function(){
	if(!isset($_SESSION['admin']))
	{
		header('location:/admin/login');
	}
    Load::Controller('controllers/admin/TongquanController.php','TongquanController','trangchu');
},'get');

Route::add('/admin/login',function(){
	if(isset($_SESSION['admin']))
	{
		header('location:/404');
	}
    Load::Controller('controllers/admin/LoginController.php','LoginController','login');
},'get');


// =================================== SLOGAN ================================================
Route::add('/admin/slogan',function(){
	if(!isset($_SESSION['admin']))
	{
		header('location:/admin/login');
	}
    Load::Controller('controllers/admin/SloganController.php','SloganController','slogan');
},'get');

Route::add('/admin/slogan/add',function(){
	if(!isset($_SESSION['admin']))
	{
		header('location:/admin/login');
	}
    Load::Controller('controllers/admin/SloganController.php','SloganController','addSlogan');
},'get');

Route::add('/admin/slogan/edit/([0-9]*)',function(){
	if(!isset($_SESSION['admin']))
	{
		header('location:/admin/login');
	}
    Load::Controller('controllers/admin/SloganController.php','SloganController','editSlogan');
},'get');
// =================================== END ===================================================



// ==================================== ERROR 404 =================================================
Route::add('/404',function(){
    Load::Controller('controllers/error/Error404Controller.php','Error404Controller','error404');
},'get');
// ====================================== END ====================================================

Route::add('/contact/([0-9]*)',function(){
    echo '<form method="post"><input type="text" name="test" /><input type="submit" value="send" /></form>';
},'get');





// =================================== API =========================================================

	Route::add('/api/admin/login',function(){
	    Load::Controller('controllers/api/AuthController.php','AuthController','auth');
	},'post');
	Route::add('/api/admin/logout',function(){
	    Load::Controller('controllers/api/AuthController.php','AuthController','logout');
	},'post');

	//*****************************************************************************************

	Route::add('/api/slogan/add',function(){
	    Load::Controller('controllers/api/SloganController.php','SloganController','addSlogan');
	},'post');







//==================================== END ==========================================================


