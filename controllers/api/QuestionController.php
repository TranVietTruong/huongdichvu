f<?php

require 'controllers/service/SlugService.php';
require 'controllers/service/TimeAgo.php';
require 'vendor/captcha/captcha.php';

class QuestionController extends Controller
{
    /**
     * summary
     */
   	public $QuestionModel;
   	public $TagModel;
    public $CatagoryModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

        include 'models/QuestionModel.php';
        include 'models/TagModel.php';
        include 'models/CatagoryModel.php';

        $this->QuestionModel = new QuestionModel();
        $this->TagModel = new TagModel();
        $this->CatagoryModel = new CatagoryModel();
    }

    public function get_captcha()
    {
        $captcha = new captcha();
        $captcha->get_captcha();
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

            // if($_SESSION['captcha'] != md5($_POST['captcha']))
            //     throw new Exception('Nhập captcha',500);

            if(captcha::verify_captcha($_POST['captcha']) == false)
                throw new Exception('Nhập captcha',500);


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
                {
                    $this->TagModel->update_total($id);
                }
                else
                {
                    $this->TagModel->add($value,SlugService::slug($value));
                }
    		}

            echo json_encode($slug,JSON_UNESCAPED_UNICODE);
        }
        catch (Exception $e) {
            http_response_code(401);
            echo json_encode($e->getMessage(),JSON_UNESCAPED_UNICODE);
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

        //------------- THỜI GIAN ĐĂNG -----------------------------------
        $i = 0;
        foreach ($data as $value) {
            $data[$i]['time'] = TimeAgo::time_ago($value['created_at']);
            $i++;
        }
        //----------------------------------------------------------------

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

    public function xem_nhieu()
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

        $data = $this->QuestionModel->paginate_orderBy_view($from,$per_page);// lấy từ ị trí $from với $per_page bài tính từ vị trí $from

        //------------- THỜI GIAN ĐĂNG -----------------------------------
        $i = 0;
        foreach ($data as $value) {
            $data[$i]['time'] = TimeAgo::time_ago($value['created_at']);
            $i++;
        }
        //----------------------------------------------------------------

        $current_page = $page;
        $first_page_url = "/api/question/xem_nhieu?page=1";
        $last_page_url = "/api/question/xem_nhieu?page=".$last_page;
        if($page == $last_page)
            $next_page_url = null;
        else
            $next_page_url = "/api/question/xem_nhieu?page=".($page+1);

        if($page == 1)
            $pre_page_url = null;
        else
            $pre_page_url = "/api/question/xem_nhieu?page=".($page-1);

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


    public function vote_nhieu()
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

        $data = $this->QuestionModel->paginate_orderBy_vote($from,$per_page);// lấy từ ị trí $from với $per_page bài tính từ vị trí $from

        //------------- THỜI GIAN ĐĂNG -----------------------------------
        $i = 0;
        foreach ($data as $value) {
            $data[$i]['time'] = TimeAgo::time_ago($value['created_at']);
            $i++;
        }
        //----------------------------------------------------------------

        $current_page = $page;
        $first_page_url = "/api/question/vote_nhieu?page=1";
        $last_page_url = "/api/question/vote_nhieu?page=".$last_page;
        if($page == $last_page)
            $next_page_url = null;
        else
            $next_page_url = "/api/question/vote_nhieu?page=".($page+1);

        if($page == 1)
            $pre_page_url = null;
        else
            $pre_page_url = "/api/question/vote_nhieu?page=".($page-1);

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

    public function get_all()
    {
      $data = $this->QuestionModel->all();
      echo json_encode($data, JSON_UNESCAPED_UNICODE);
    }

    public function trong_ngay()
    {
        if(isset($_GET['page']))
            $page = $_GET['page'];
        else
            $page = 1;

        $total = $this->QuestionModel->count_paginate_inday(); // tổng số post;
        $per_page = 7;                          // số post trên 1 trang;
        $last_page = ceil($total/$per_page);     // tổng số trang;
        $from = ($page - 1) * $per_page;        // bắt đầu lấy từ vị trí $from
        $to = $from + $per_page;                // đến vị trí $to

        $data = $this->QuestionModel->paginate_inday($from,$per_page);// lấy từ ị trí $from với $per_page bài tính từ vị trí $from

        //------------- THỜI GIAN ĐĂNG -----------------------------------
        $i = 0;
        foreach ($data as $value) {
            $data[$i]['time'] = TimeAgo::time_ago($value['created_at']);
            $i++;
        }
        //----------------------------------------------------------------

        $current_page = $page;
        $first_page_url = "/api/question/trong_ngay?page=1";
        $last_page_url = "/api/question/trong_ngay?page=".$last_page;
        if($page == $last_page)
            $next_page_url = null;
        else
            $next_page_url = "/api/question/trong_ngay?page=".($page+1);

        if($page == 1)
            $pre_page_url = null;
        else
            $pre_page_url = "/api/question/trong_ngay?page=".($page-1);

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


    public function trong_tuan()
    {
        if(isset($_GET['page']))
            $page = $_GET['page'];
        else
            $page = 1;

        $total = $this->QuestionModel->count_paginate_inweek(); // tổng số post;
        $per_page = 7;                          // số post trên 1 trang;
        $last_page = ceil($total/$per_page);     // tổng số trang;
        $from = ($page - 1) * $per_page;        // bắt đầu lấy từ vị trí $from
        $to = $from + $per_page;                // đến vị trí $to

        $data = $this->QuestionModel->paginate_inweek($from,$per_page);// lấy từ ị trí $from với $per_page bài tính từ vị trí $from

        //------------- THỜI GIAN ĐĂNG -----------------------------------
        $i = 0;
        foreach ($data as $value) {
            $data[$i]['time'] = TimeAgo::time_ago($value['created_at']);
            $i++;
        }
        //----------------------------------------------------------------

        $current_page = $page;
        $first_page_url = "/api/question/trong_tuan?page=1";
        $last_page_url = "/api/question/trong_tuan?page=".$last_page;
        if($page == $last_page)
            $next_page_url = null;
        else
            $next_page_url = "/api/question/trong_tuan?page=".($page+1);

        if($page == 1)
            $pre_page_url = null;
        else
            $pre_page_url = "/api/question/trong_tuan?page=".($page-1);

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

    public function trong_thang()
    {
        if(isset($_GET['page']))
            $page = $_GET['page'];
        else
            $page = 1;

        $total = $this->QuestionModel->count_paginate_inmonth(); // tổng số post;
        $per_page = 7;                          // số post trên 1 trang;
        $last_page = ceil($total/$per_page);     // tổng số trang;
        $from = ($page - 1) * $per_page;        // bắt đầu lấy từ vị trí $from
        $to = $from + $per_page;                // đến vị trí $to

        $data = $this->QuestionModel->paginate_inmonth($from,$per_page);// lấy từ ị trí $from với $per_page bài tính từ vị trí $from

        //------------- THỜI GIAN ĐĂNG -----------------------------------
        $i = 0;
        foreach ($data as $value) {
            $data[$i]['time'] = TimeAgo::time_ago($value['created_at']);
            $i++;
        }
        //----------------------------------------------------------------

        $current_page = $page;
        $first_page_url = "/api/question/trong_thang?page=1";
        $last_page_url = "/api/question/trong_thang?page=".$last_page;
        if($page == $last_page)
            $next_page_url = null;
        else
            $next_page_url = "/api/question/trong_thang?page=".($page+1);

        if($page == 1)
            $pre_page_url = null;
        else
            $pre_page_url = "/api/question/trong_thang?page=".($page-1);

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


    public function get_by_category()
    {
        if(isset($_POST['slug']))
            $slug = $_POST['slug'];
        else
            http_response_code(404);

        if(isset($_GET['page']))
            $page = $_GET['page'];
        else
            $page = 1;

        $category = $this->CatagoryModel->find_by_slug($slug);

        if(empty($category))
            http_response_code(404);

        $total = $this->QuestionModel->count_paginate_category($category['id']); // tổng số post;
        $per_page = 7;                          // số post trên 1 trang;
        $last_page = ceil($total/$per_page);     // tổng số trang;
        $from = ($page - 1) * $per_page;        // bắt đầu lấy từ vị trí $from
        $to = $from + $per_page;                // đến vị trí $to

        $data = $this->QuestionModel->paginate_category($category['id'],$from,$per_page);// lấy từ ị trí $from với $per_page bài tính từ vị trí $from

        //------------- THỜI GIAN ĐĂNG -----------------------------------
        $i = 0;
        foreach ($data as $value) {
            $data[$i]['time'] = TimeAgo::time_ago($value['created_at']);
            $i++;
        }
        //----------------------------------------------------------------

        $current_page = $page;
        $first_page_url = "/api/question/get_by_category?page=1";
        $last_page_url = "/api/question/get_by_category?page=".$last_page;
        if($page == $last_page)
            $next_page_url = null;
        else
            $next_page_url = "/api/question/get_by_category?page=".($page+1);

        if($page == 1)
            $pre_page_url = null;
        else
            $pre_page_url = "/api/question/get_by_category?page=".($page-1);

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
