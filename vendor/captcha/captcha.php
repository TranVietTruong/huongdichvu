<?php 

class captcha
{
	public function get_captcha()
	{
		// $length = 5;

		// $md5 = md5(rand()); // lấy chuỗi ngẫu nhiên

		// $text = substr($md5,0,$length); // lấy trong chuỗi $md5 ngẫu nhiên $length phần tử
		// $captcha = imagecreatefrompng("vendor/captcha/images/captcha.png");

		// $font= 5;

		// $image_width=imagesx($captcha);
		// $image_height=imagesy($captcha);

		// for($i=0;$i<20;$i++)
		// 	imageline ( $captcha , rand(10,$image_width) , rand(10,$image_width) , rand(0,$image_width),rand(0,$image_width),rand(0,100000));

		// $text_width=imagefontwidth($font)*$length;
		// $text_height=imagefontheight($font);

		
		// imagestring($captcha, $font, ($image_width-$text_width)/2 , ($image_height-$text_height)/2, $text, rand(0,100000));

		// $_SESSION['captcha'] = md5($text);

		// header("Content-type: image/png");
		// imagepng($captcha);
		// imagedestroy($captcha);


		$image = imagecreatetruecolor(200, 50);

		imageantialias($image, true);

		$colors = [];

		$red = rand(0,100);
		$green = rand(0,50);
		$blue = rand(0,100);

		for($i = 0; $i < 5; $i++) {
			$colors[] = imagecolorallocate($image, $red - 20*$i, $green - 20*$i, $blue - 20*$i);
		}

		imagefill($image, 0, 0, $colors[0]);

		// for($i = 0; $i < 5; $i++) {
		// 	imagesetthickness($image, rand(2, 5));
		// 	$line_color = $colors[rand(1, 4)];
		// 	imagerectangle($image, rand(-10, 190), rand(-10, 10), rand(-10, 190), rand(40, 60), $line_color);
		// }

		$color1 = imagecolorallocate($image, rand(50,255), rand(100,255), rand(100,255));
		$color2 = imagecolorallocate($image, rand(50,255), rand(100,255), rand(100,255));
		$color3 = imagecolorallocate($image, rand(50,255), rand(100,255), rand(100,255));
		$color4 = imagecolorallocate($image, rand(50,255), rand(100,255), rand(100,255));
		$color5 = imagecolorallocate($image, rand(50,255), rand(100,255), rand(100,255));

		$textcolors = [$color1,$color2,$color3,$color4,$color5];

		$fonts = [dirname(__FILE__).'\Arial.ttf',dirname(__FILE__).'\Lobster-Regular.ttf'];


		$string_length = 5;
		$permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$captcha_string = substr(str_shuffle($permitted_chars),0,$string_length);

		$_SESSION['captcha'] = md5($captcha_string);

		for($i = 0; $i < $string_length; $i++) {
			$letter_space = 170/$string_length;
			$initial = 15;

			imagettftext($image,rand(18,24), rand(-10, 10), $initial + $i*$letter_space, rand(25, 45), $textcolors[rand(0,4)], $fonts[array_rand($fonts)], $captcha_string[$i]);
		}

		header('Content-type: image/png');
		imagepng($image);
		imagedestroy($image);

	}

	public static function verify_captcha($captcha)
	{
		if(isset($_SESSION['captcha']))
		{
			if($_SESSION['captcha'] === md5($captcha))
				return true;
			else
				return false;
		}
		else
			return false;
	}
}