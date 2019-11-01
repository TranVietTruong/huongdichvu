<?php
require 'vendor/autoload.php';
use Phpml\Classification\NaiveBayes;
use Phpml\FeatureExtraction\TfIdfTransformer;

/**
 * summary
 */
class Tokenizer
{
    /**
     * summary
     */
    public $str;

    public function __construct($string)
    {
        $string = preg_replace('/[\s]+/mu',' ', $string); 
        $string = preg_replace('/[\'\/~`\!@#\$%\^&\*\(\)_\-\+=\{\}\[\]\|\;\:\"\<\>\,\.\?\\\]/', ' ', $string);
        $string = mb_strtolower($string,'UTF-8');
        $this->str = trim($string);
    }

    // tách từ
    public function execute()
    {	

    	$string = preg_replace('/[\s]+/mu',' ', $this->str); 
        $string = preg_replace('/[\'\/~`\!@#\$%\^&\*\(\)_\-\+=\{\}\[\]\|\;\:\"\<\>\,\.\?\\\]/', ' ', $string);
    	$string = mb_strtolower($string,'UTF-8');
    	$str = trim($string); 

    	//$dataset = file_get_contents('vendor/split_words/dataset.txt'); 
    	$arr_str = explode(' ',$str);
    	$list_word = [];
    	$done = false;

    	$dataset = [];
    	$fn = 'vendor/tokenizer/dataset.txt';
        $fh = fopen($fn, "r");
        while(!feof($fh)) 
        {
            $line = fgets($fh);
           	array_push($dataset,trim($line));
        }
        fclose($fh);


    	while(count($arr_str) > 0)
    	{
    		$data = $arr_str;
    		while ($done == false) 
	    	{
	    		$word = join(' ',$data); 
	    		if(count($data) == 1)
	    		{
	    			array_push($list_word,$word);
		    		$done = true;
	    		}
	    		else
	    		{
	    			if(count($data) < 3)
	    			{
	    				for($i = 0;$i<count($dataset) ;$i++)
		    			{
		    				if(trim($word) == $dataset[$i])
		    				{
		    					array_push($list_word,$word);
				    			$done = true;
				    			break;
		    				}
		    			}	
	    			}
		    		if($done == false)
	    				array_pop($data);
	    		}
	    	}
	    	$done = false;
	    	$len = count($data);
	    	for($i = 0;$i < $len; $i++)
	    		array_shift($arr_str);
    	}

    	$result = [];
    	$i = 0;
    	foreach ($list_word as $word) 
    	{
    		array_push($result,join('_',explode(' ',$word)));
    	}
    	

    	return join(' ',$result);
    }

    // tách từ và loại bỏ các từ stop word
    public function stop_word()
    {	

    	$string = preg_replace('/[\s]+/mu',' ', $this->str); 
        $string = preg_replace('/[\'\/~`\!@#\$%\^&\*\(\)_\-\+=\{\}\[\]\|\;\:\"\<\>\,\.\?\\\]/', ' ', $string);
    	$string = mb_strtolower($string,'UTF-8');
    	$str = trim($string); 

    	$arr_str = explode(' ',$str);
    	$list_word = [];
    	$done = false;

    	$dataset = [];
    	$fn = 'vendor/tokenizer/dataset.txt';
        $fh = fopen($fn, "r");
        while(!feof($fh)) 
        {
            $line = fgets($fh);
           	array_push($dataset,trim($line));
        }
        fclose($fh);


    	while(count($arr_str) > 0)
    	{
    		$data = $arr_str;
    		while ($done == false) 
	    	{
	    		$word = join(' ',$data); 
	    		if(count($data) == 1)
	    		{
	    			array_push($list_word,$word);
		    		$done = true;
	    		}
	    		else
	    		{
	    			if(count($data) < 3)
	    			{
	    				for($i = 0;$i<count($dataset) ;$i++)
		    			{
		    				if(trim($word) == $dataset[$i])
		    				{
		    					array_push($list_word,$word);
				    			$done = true;
				    			break;
		    				}
		    			}	
	    			}
		    		if($done == false)
	    				array_pop($data);
	    		}
	    	}
	    	$done = false;
	    	$len = count($data);
	    	for($i = 0;$i < $len; $i++)
	    		array_shift($arr_str);
    	}



    	$stop_words = [];
    	$fn = 'vendor/tokenizer/vietnamese-stopwords.txt';
        $fh = fopen($fn, "r");
        while(!feof($fh)) 
        {
            $line = fgets($fh);
           	array_push($stop_words,trim($line));
        }
        fclose($fh);


    	$i = 0;
    	foreach ($list_word as $value) {
    		for($j = 0;$j < count($stop_words); $j++)
    		{
    			if(trim($value) == $stop_words[$j])
    			{
    				unset($list_word[$i]);
    				break;
    			}
    		}
    		$i++;
    	}
    		

    	$result = [];
    	$i = 0;
    	foreach ($list_word as $word) 
    	{
    		array_push($result,join('_',explode(' ',$word)));
    	}
    	

    	return join(' ',$result);
    }

}