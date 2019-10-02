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

        $tag_model = $this->TagModel->all();

		foreach ($insertTag as $value) {
            $update = 0;
            $id = -1;
            foreach ($tag_model as $tag) {
                if($tag['slug'] == SlugService::slug($value))
                {
                    $update = 1;
                    $id = $tag['id'];
                    break;
                }
            }

            if($update)
                $this->TagModel->update_total($id);
            else
                $this->TagModel->add($value);
		}
    }


    public function get_question()
    {
        if(isset($_GET['page']))
            $page = $_GET['page'];
        else
            $page = 1;

        $total = $this->QuestionModel->count(); // tổng số post;
        $per_page = 7;                          // số post trên 1 trang;
        $last_page = ceil($total/$per_page);     // tổng số trang;
        $from = ($page - 1) * $per_page;        // bắt đầu lấy từ vị trí $from
        $to = $from + $per_page;                // đến vị trí $to

        $data = $this->QuestionModel->paginate($from,$per_page);// lấy từ ị trí $from với $per_page bài tính từ vị trí $from

        $current_page = $page;
        $first_page_url = "/api/question/get_question?page=1";
        $last_page_url = "/api/question/get_question?page=".$last_page;
        if($page == $last_page)
            $next_page_url = null;
        else
            $next_page_url = "/api/question/get_question?page=".($page+1);

        if($page == 1)
            $pre_page_url = null;
        else
            $pre_page_url = "/api/question/get_question?page=".($page-1);

        $pagination = [
            'current_page' => $current_page,
            'data' => $data,
            'from' => $from,
            'to'   => $to,
            'per_page' => $per_page,
            'total' => $total,
            'last_page' => $last_page,
            'fist_page_url' => $first_page_url,
            'last_page_url' => $last_page_url,
            'next_page_url' => $next_page_url,
            'pre_page_url' => $pre_page_url
        ];

        echo json_encode($pagination,JSON_UNESCAPED_UNICODE);
    }

}
