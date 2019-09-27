<?php
// ================================== ADMIN ===========================================================

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

	// =================================== CATAGORY ================================================
Route::add('/admin/catagory',function(){
	if(!isset($_SESSION['admin']))
	{
		header('location:/admin/login');
	}
	Load::Controller('controllers/admin/CatagoryController.php','CatagoryController','catagory');
},'get');

Route::add('/admin/catagory/add',function(){
	if(!isset($_SESSION['admin']))
	{
		header('location:/admin/login');
	}
	Load::Controller('controllers/admin/CatagoryController.php','CatagoryController','addCatagory');
},'get');

Route::add('/admin/catagory/edit/([0-9]*)',function(){
	if(!isset($_SESSION['admin']))
	{
		header('location:/admin/login');
	}
	Load::Controller('controllers/admin/CatagoryController.php','CatagoryController','editCatagory');
},'get');




// =================================== END ===================================================