<?php
include 'bootstrap/Routing/Router.php';
include 'bootstrap/Routing/AutoLoad.php';

Route::add('/admin',function(){
    Load::Controller('controllers/AdminController.php','AdminController','dasboard');
},'get');

Route::add('/admin/slogan',function(){
    Load::Controller('controllers/AdminController.php','AdminController','slogan');
},'get');

Route::add('/admin/slogan/add',function(){
    Load::Controller('controllers/AdminController.php','AdminController','addSlogan');
},'get');


Route::add('/api/slogan/add',function(){
    Load::Controller('controllers/AdminController.php','AdminController','test');
},'post');



Route::add('/contact/([0-9]*)',function(){
    echo '<form method="post"><input type="text" name="test" /><input type="submit" value="send" /></form>';
},'get');



Route::run('/');