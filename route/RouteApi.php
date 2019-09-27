<?php
	// =================================== API =========================================================

	Route::add('/api/admin/login',function(){
	    Load::Controller('controllers/api/AuthController.php','AuthController','auth');
	},'post');
	Route::add('/api/admin/logout',function(){
	    Load::Controller('controllers/api/AuthController.php','AuthController','logout');
	},'post');

	//*********************************** SLOGAN ******************************************************

	Route::add('/api/slogan/getall',function(){
	    Load::Controller('controllers/api/SloganController.php','SloganController','getAllSlogan');
	},'post');
	Route::add('/api/slogan/getcurrent',function(){
	    Load::Controller('controllers/api/SloganController.php','SloganController','getCurrentSlogan');
	},'post');
	Route::add('/api/slogan/add',function(){
	    Load::Controller('controllers/api/SloganController.php','SloganController','addSlogan');
	},'post');
	Route::add('/api/slogan/update-active',function(){
	    Load::Controller('controllers/api/SloganController.php','SloganController','updateActive');
	},'post');
	Route::add('/api/slogan/remove',function(){
	    Load::Controller('controllers/api/SloganController.php','SloganController','removeSlogan');
	},'post');
	Route::add('/api/slogan/update',function(){
	    Load::Controller('controllers/api/SloganController.php','SloganController','updateSlogan');
	},'post');
	Route::add('/api/slogan/update_image',function(){
	    Load::Controller('controllers/api/SloganController.php','SloganController','updateImage');
	},'post');
	Route::add('/api/slogan/update_rank',function(){
	    Load::Controller('controllers/api/SloganController.php','SloganController','updateRank');
	},'post');

	// ******************************** CATAGORY *************************************************
	Route::add('/api/catagory/get_all',function(){
	    Load::Controller('controllers/api/CatagoryController.php','CatagoryController','getAllCatagory');
	},'post');
	Route::add('/api/catagory/current_catagory',function(){
	    Load::Controller('controllers/api/CatagoryController.php','CatagoryController','getCurrentCatagory');
	},'post');
	Route::add('/api/catagory/add_catagory',function(){
	    Load::Controller('controllers/api/CatagoryController.php','CatagoryController','addCatagory');
	},'post');

	Route::add('/api/catagory/update_image',function(){
	    Load::Controller('controllers/api/CatagoryController.php','CatagoryController','updateImage');
	},'post');
	Route::add('/api/catagory/update_name',function(){
	    Load::Controller('controllers/api/CatagoryController.php','CatagoryController','updateName');
	},'post');
	Route::add('/api/catagory/remove',function(){
	    Load::Controller('controllers/api/CatagoryController.php','CatagoryController','removeCatagory');
	},'post');
	Route::add('/api/catagory/update_rank',function(){
	    Load::Controller('controllers/api/CatagoryController.php','CatagoryController','updateRank');
	},'post');






//==================================== END ==========================================================