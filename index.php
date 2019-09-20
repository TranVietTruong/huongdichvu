<?php 
	date_default_timezone_set("Asia/Bangkok");
	session_start();
	include "config/config.php";
	include "bootstrap/Base/Database.php";
	include "bootstrap/Base/Model.php";
	include "bootstrap/Base/View.php";
	include "bootstrap/Base/Controller.php";
	include "route/web.php";
	Route::run('/');
