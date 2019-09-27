<?php
include 'bootstrap/Routing/Router.php';
include 'bootstrap/Routing/AutoLoad.php';
include 'RouteClient.php';
include 'RouteAdmin.php';
include 'RouteApi.php';

// ==================================== ERROR 404 =================================================
Route::add('/404',function(){
    Load::Controller('controllers/error/Error404Controller.php','Error404Controller','error404');
},'get');
// ====================================== END ====================================================







