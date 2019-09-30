<?php

require 'controllers/service/SlugService.php';

class QuestionController extends Controller
{
    /**
     * summary
     */
   	public $QuestionModel;
   	public $TagModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

        include 'models/QuestionModel.php';
        include 'models/TagModel.php';

        $this->QuestionModel = new QuestionModel();
        $this->TagModel = new TagModel();
    }

  
    public function post_question()
    {
    	try 
    	{
    		if(isset($_POST['major']))
	    		$major = $_POST['major'];
	    	else
	    		throw new Exception('Không thể đăng câu hỏi',500);

	    	if(isset($_POST['title']))
	    		$title = $_POST['title'];
	    	else
	    		throw new Exception('Không thể đăng câu hỏi',500);

	    	if(isset($_POST['tags']))
	    		$tags = $_POST['tags'][0];
	    	else
	    		throw new Exception('Không thể đăng câu hỏi',500);

	    	if(isset($_POST['content']))
	    		$content = $_POST['content'];
	    	else
	    		throw new Exception('Không thể đăng câu hỏi',500);

	    	$slug = SlugService::slug($title);

    		$this->QuestionModel->add($major,$_SESSION['user']['id'],$title,$slug,$content,$tags);

    		$insertTag = explode(',',$tags);

    		foreach ($insertTag as $value) {
    			$this->TagModel->add($value);
    		}

    	} 
    	catch (Exception $e) 
    	{
    		http_response_code(500);
    		if(strpos($e->getMessage(),'Integrity constraint violation: 1062 Duplicate entry'))
    			echo 'Có vẻ như vấn đề này đã được hỏi rồi';
    		else
    			echo $e->getMessage();
    	}
    }


    public function get_question()
    {
        $listQuestion = $this->QuestionModel->all();
        echo json_encode($listQuestion,JSON_UNESCAPED_UNICODE);
    }

}
