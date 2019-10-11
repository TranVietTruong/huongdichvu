<?php
class NewsController extends Controller
{
    /**
     * summary
     */
    public $NewsModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

       	include 'models/NewsModel.php';
        $this->NewsModel = new NewsModel();
    }

    public function get_news()
    {
        if(isset($_GET['page']))
            $page = $_GET['page'];
        else
            $page = 1;

        $total = $this->NewsModel->count(); // tổng số post;
        $per_page = 10;                          // số post trên 1 trang;
        $last_page = ceil($total/$per_page);     // tổng số trang;
        $from = ($page - 1) * $per_page;        // bắt đầu lấy từ vị trí $from
        $to = $from + $per_page;                // đến vị trí $to

        $data = $this->NewsModel->paginate($from,$per_page);// lấy từ ị trí $from với $per_page bài tính từ vị trí $from

        $current_page = $page;
        $first_page_url = "/api/question/get_news?page=1";
        $last_page_url = "/api/question/get_news?page=".$last_page;
        if($page == $last_page)
            $next_page_url = null;
        else
            $next_page_url = "/api/question/get_news?page=".($page+1);

        if($page == 1)
            $pre_page_url = null;
        else
            $pre_page_url = "/api/question/get_news?page=".($page-1);

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


    public function search()
    {
        if(isset($_POST['keyword']))
            $keyword = $_POST['keyword'];
        else
            http_response_code(500);

        $data = $this->NewsModel->like($keyword);
        echo json_encode($data,JSON_UNESCAPED_UNICODE);
    }

    public function remove()
    {
      if(isset($_POST['id']))
          $id = $_POST['id'];
      $this->NewsModel->remove($id);
    }

    public function preview()
    {
      if(isset($_POST['link']))
      {
        $link = $_POST['link'];

        include 'vendor/Simple_HTML_Dom/simple_html_dom.php';
        $html = file_get_html($link);
        $home = explode("/", $link)[2];
        if($home == "www.brandsvietnam.com")
        {
          $data = $html->find('div.reading-content', 0);
          // $data = "ok";
          echo json_encode($data, JSON_UNESCAPED_UNICODE);
        }else {
          echo 'Nothing';
        }

      }

    }
 }
