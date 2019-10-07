<?php
class SearchController extends Controller
{
    /**
     * summary
     */

    public $QuestionModel;
    public $NewsModel;
    public $SearchModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

       	include 'models/QuestionModel.php';
        include 'models/NewsModel.php';
        include 'models/SearchModel.php';

        $this->QuestionModel = new QuestionModel();
        $this->NewsModel = new NewsModel();
        $this->SearchModel = new SearchModel();
    }

    public function search()
    {
        if(isset($_POST['species']))
            $species = $_POST['species'];

        if(isset($_POST['category']))
            $category = $_POST['category'];

        if(isset($_POST['keysearch']))
            $keyword = $_POST['keysearch'];

        $searchs = $this->SearchModel->like($keyword);
        $questions = [];
        $news = [];

        if($species == 'question')
        {

            if($category == 'NULL')
            {
                $questions = $this->QuestionModel->like($keyword);
            }
            else
            {
                $questions = $this->QuestionModel->like_and_cate($category,$keyword);
            }
        }
        else if($species == 'news')
        {
            $news = $this->NewsModel->like_top_5($keyword);
        }
        else
        {
           
            if($category == 'NULL')
            {
                $questions = $this->QuestionModel->like($keyword);
            }
            else
            {
                $questions = $this->QuestionModel->like_and_cate($category,$keyword);
            }

            $news = $this->NewsModel->like_top_5($keyword);
        }

        $data = [
            'searchs' => $searchs,
            'questions' => $questions,
            'news' => $news
        ];

        echo json_encode($data,JSON_UNESCAPED_UNICODE);
    }

 }