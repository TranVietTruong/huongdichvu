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

	Route::add('/api/question/xem_nhieu',function(){
	    Load::Controller('controllers/api/QuestionController.php','QuestionController','xem_nhieu');
	},'post');

	Route::add('/api/question/vote_nhieu',function(){
	    Load::Controller('controllers/api/QuestionController.php','QuestionController','vote_nhieu');
	},'post');

	Route::add('/api/question/trong_ngay',function(){
	    Load::Controller('controllers/api/QuestionController.php','QuestionController','trong_ngay');
	},'post');

	Route::add('/api/question/trong_tuan',function(){
	    Load::Controller('controllers/api/QuestionController.php','QuestionController','trong_tuan');
	},'post');

	Route::add('/api/question/trong_thang',function(){
	    Load::Controller('controllers/api/QuestionController.php','QuestionController','trong_thang');
	},'post');

	Route::add('/api/question/get_all',function(){
	    Load::Controller('controllers/api/QuestionController.php','QuestionController','get_all');
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

	Route::add('/api/question/get_by_category',function(){
	    Load::Controller('controllers/api/QuestionController.php','QuestionController','get_by_category');
	},'post');

	Route::add('/api/question/de_xuat_cau_tra_loi',function(){
	    Load::Controller('controllers/api/DetailQuestionController.php','DetailQuestionController','de_xuat_cau_tra_loi');
	},'post');

	Route::add('/api/question/remove',function(){
			Load::Controller('controllers/api/QuestionController.php','QuestionController','remove');
	},'post');

	Route::add('/api/question/updateActive',function(){
			Load::Controller('controllers/api/QuestionController.php','QuestionController','updateActive');
	},'post');

// ******************************************* ANSWER ***************************************************
Route::add('/api/answer/remove',function(){
		Load::Controller('controllers/api/AnswerController.php','AnswerController','remove');
},'post');

Route::add('/api/answer/updateActive',function(){
		Load::Controller('controllers/api/AnswerController.php','AnswerController','updateActive');
},'post');

	// ******************************************* USER ***************************************************

	Route::add('/api/user/get_tag',function(){
	    Load::Controller('controllers/api/UserController.php','UserController','get_tag');
	},'post');

	Route::add('/api/user/get_question',function(){
	    Load::Controller('controllers/api/UserController.php','UserController','get_question');
	},'post');
	Route::add('/api/user/get_answer',function(){
	    Load::Controller('controllers/api/UserController.php','UserController','get_answer');
	},'post');

	Route::add('/api/user/remove_question',function(){
	    Load::Controller('controllers/api/UserController.php','UserController','remove_question');
	},'post');

	Route::add('/api/user/remove_answer',function(){
	    Load::Controller('controllers/api/UserController.php','UserController','remove_answer');
	},'post');

	Route::add('/api/user/update_name',function(){
	    Load::Controller('controllers/api/UserController.php','UserController','update_name');
	},'post');

	Route::add('/api/user/update_pass',function(){
	    Load::Controller('controllers/api/UserController.php','UserController','update_pass');
	},'post');

	Route::add('/api/user/get_users',function(){
		    Load::Controller('controllers/api/UserController.php','UserController','get_users');
		},'post');

	Route::add('/api/user/update-active',function(){
			   Load::Controller('controllers/api/UserController.php','UserController','updateActive');
		},'post');

	Route::add('/api/user/remove',function(){
				  Load::Controller('controllers/api/UserController.php','UserController','remove');
		},'post');

// ******************************************* ADMIN ***************************************************
	Route::add('/api/admin/get_all',function(){
					Load::Controller('controllers/api/AdministratorController.php','AdministratorController','getAll');
		},'post');

	Route::add('/api/admin/update_active',function(){
					Load::Controller('controllers/api/AdministratorController.php','AdministratorController','updateActive');
		},'post');

	Route::add('/api/admin/remove',function(){
					Load::Controller('controllers/api/AdministratorController.php','AdministratorController','remove');
		},'post');

	Route::add('/api/admin/add',function(){
					Load::Controller('controllers/api/AdministratorController.php','AdministratorController','add');
		},'post');


//==================================== END ==========================================================


//************************************ HOME PAGES **********************************************************

	Route::add('/api/register',function(){
	    Load::Controller('controllers/api/RegisterController.php','RegisterController','register');
	},'post');



//************************************* NEWS *************************************************************
	Route::add('/api/news/get_news',function(){
	    Load::Controller('controllers/api/NewsController.php','NewsController','get_news');
	},'post');

	Route::add('/api/news/search',function(){
	    Load::Controller('controllers/api/NewsController.php','NewsController','search');
	},'post');

	Route::add('/api/news/remove',function(){
			Load::Controller('controllers/api/NewsController.php','NewsController','remove');
	},'post');

	Route::add('/api/news/add',function(){
			Load::Controller('controllers/api/NewsController.php','NewsController','addNews');
	},'post');
// ************************************ SEARCH ******************************************************

	Route::add('/api/search/keyword',function(){
	    Load::Controller('controllers/api/SearchController.php','SearchController','search');
	},'post');




//************************************ FOREGET PASSWORD ********************************************
	Route::add('/api/user/forget_password',function(){
	    Load::Controller('controllers/api/UserController.php','UserController','forget_password');
	},'post');
