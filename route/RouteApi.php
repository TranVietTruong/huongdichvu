<?php
	// =================================== API =========================================================

	Route::add('/api/admin/login',function(){
	    Load::Controller('controllers/api/AuthController.php','AuthController','auth');
	},'post');
	Route::add('/api/admin/logout',function(){
	    Load::Controller('controllers/api/AuthController.php','AuthController','logout');
	},'post');

	Route::add('/api/user/login',function(){
	    Load::Controller('controllers/api/AuthController.php','AuthController','auth_user');
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

	//***************************************** QUESTION *************************************************

	Route::add('/api/question/get_question',function(){
	    Load::Controller('controllers/api/QuestionController.php','QuestionController','get_question');
	},'post');

	Route::add('/api/question/post_question',function(){
	    Load::Controller('controllers/api/QuestionController.php','QuestionController','post_question');
	},'post');

	Route::add('/api/tag/get_all',function(){
	    Load::Controller('controllers/api/TagController.php','TagController','get_all');
	},'post');

	Route::add('/api/question/detail_question',function(){
	    Load::Controller('controllers/api/DetailQuestionController.php','DetailQuestionController','detail_question');
	},'post');

	Route::add('/api/question/get_all_answer',function(){
	    Load::Controller('controllers/api/DetailQuestionController.php','DetailQuestionController','get_all_answer_by_id_question');
	},'post');

	Route::add('/api/question/add_answer',function(){
	    Load::Controller('controllers/api/DetailQuestionController.php','DetailQuestionController','add_answer');
	},'post');

	Route::add('/api/question/update_view',function(){
	    Load::Controller('controllers/api/DetailQuestionController.php','DetailQuestionController','update_view');
	},'post');

	Route::add('/api/question/vote',function(){
	    Load::Controller('controllers/api/DetailQuestionController.php','DetailQuestionController','vote');
	},'post');

	Route::add('/api/question/vote_answer',function(){
	    Load::Controller('controllers/api/DetailQuestionController.php','DetailQuestionController','vote_answer');
	},'post');






//==================================== END ==========================================================

//************************************ HOME PAGES **********************************************************

	Route::add('/api/register',function(){
	    Load::Controller('controllers/api/RegisterController.php','RegisterController','register');
	},'post');