<?php
/**
 * summary
 */
class Load
{
    public function __construct()
    {
        
    }
    public static function Controller($path,$controller,$method)
    {
    	if(file_exists($path))
		{
			include $path;
			$c = new $controller();
			if(method_exists($c,$method))
			{
				$c->$method();
			}
			else
			{
				header("HTTP/1.0 404 Not Found");
				die();
			}
		}
		else
		{
			header("HTTP/1.0 404 Not Found");
			die();
		}
    }
}