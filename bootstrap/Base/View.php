<?php 
	class View
	{
		public function __construct()
		{
			
		}

		public function Render($path,$include = true)
		{
			if($include)
			{
				include "resources/views/".$path.".php";
			}
			else
			{
				include "views";
			}
		}
	}