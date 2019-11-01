<?php
require 'vendor/tokenizer/tokenizer.php';

require 'vendor/autoload.php';
use Phpml\Classification\NaiveBayes;
use Phpml\FeatureExtraction\TfIdfTransformer;
use Phpml\FeatureExtraction\TokenCountVectorizer;
use Phpml\Tokenization\WhitespaceTokenizer;


class DetailQuestionController extends Controller
{
    /**
     * summary
     */
    public $AnswerModel;
    public $QuestionModel;
    public $VoteQuestionModel;
    public $VoteAnswerModel;
    public $TagModel;
    public $CatagoryModel;

    public function __construct($param = NULL)
    {
        parent::__construct();
        
        include 'models/AnswerModel.php';
        include 'models/QuestionModel.php';
        include 'models/VoteQuestionModel.php';
        include 'models/VoteAnswerModel.php';
        include 'models/TagModel.php';
        include 'models/CatagoryModel.php';

        $this->QuestionModel = new QuestionModel();
        $this->AnswerModel = new AnswerModel();
        $this->VoteQuestionModel = new VoteQuestionModel();
        $this->VoteAnswerModel = new VoteAnswerModel();
        $this->TagModel = new TagModel();
        $this->CatagoryModel = new CatagoryModel();
    }

    public function detail_question()
    {
        if(isset($_POST['slug']))
            $slug = $_POST['slug'];
        else
            http_response_code(500);

        $question = $this->QuestionModel->find($slug);

        if(isset($_SESSION['user']))
            $id_user = $_SESSION['user']['id'];
        else
            $id_user = -1;

        $vote_question = $this->VoteQuestionModel->where($id_user,$question[0]['id']);

        if(!empty($vote_question))
        {
            $question[0]['voted'] = true;
        }
        else
        {
            $question[0]['voted'] = false;
        }

        if(!empty($question))
            echo json_encode($question,JSON_UNESCAPED_UNICODE);
        else
            http_response_code(500);
    }

    public function get_all_answer_by_id_question()
    {
        if(isset($_POST['slug']))
            $slug = $_POST['slug'];
        else
            http_response_code(500);

        $question = $this->QuestionModel->find($slug);

        if(!empty($question))
        {
            $answers = $this->AnswerModel->findByIdQuestion($question[0]['id']);

            if(isset($_SESSION['user']))
                $id_user = $_SESSION['user']['id'];
            else
                $id_user = -1;

            $i = 0;
            foreach ($answers as $answer) {
                $vote_answer = $this->VoteAnswerModel->where($id_user,$answer['id']);
                
                if(count($vote_answer) == 1)
                {
                    $answers[$i]['voted'] = true;
                }
                else
                {
                    $answers[$i]['voted'] = false;
                }
                $i++;
            }



            echo json_encode($answers,JSON_UNESCAPED_UNICODE);
           
        }
        else
            http_response_code(500);
    }


    public function add_answer()
    {
        try
        {
            if(!isset($_SESSION['user']))
                throw new Exception('Bạn phải đăng nhập để sử dụng chức năng này',401);

            if(isset($_POST['id_question']))
                $id_question = $_POST['id_question'];
            else
                http_response_code(500);

            if(isset($_POST['content']))
                $content = $_POST['content'];
            else
                http_response_code(500);

            if(isset($_POST['content_text']))
                $content_text = $_POST['content_text'];
            else
                http_response_code(500);

            if(isset($_POST['tag']))
                $tag = $_POST['tag'];
            else
                http_response_code(500);

            $tokenizer = new Tokenizer($content_text);
            $content_word = $tokenizer->stop_word();

            $id = $this->AnswerModel->add($id_question,$_SESSION['user']['id'],$content,$content_text,$content_word,$tag);

            $data = $this->AnswerModel->find($id);

            echo json_encode($data,JSON_UNESCAPED_UNICODE);
        }
        catch(Exception $e)
        {
            echo $e->getMessage();
            http_response_code(401);
        }
        
    }

    public function update_view()
    {
    
        if(isset($_POST['id']))
            $id = $_POST['id'];
        else
            http_response_code(500);

        $sessionKey = 'viewed_'.$id;
        $sessionView = $_SESSION[$sessionKey]; // lần đầu vào session của bài viết đang rỗng
        if(!$sessionView)
        {
            $_SESSION[$sessionKey] = 1;
            $this->QuestionModel->update_view($id);
        }
        else
            echo 'viewed';
    }

    public function vote()
    {
        if(!isset($_SESSION['user']))
        {
            http_response_code(401);
            echo 'Bạn phải đăng nhập để sử dụng chức năng này';
        }
        else
        {
            if(isset($_POST['id_question']))
                $id_question = $_POST['id_question'];
            else
                http_response_code(500);

            if(isset($_POST['action']))
                $action = $_POST['action'];
            else
                http_response_code(500);

            switch ($action) {
                case 'vote':
                    $this->VoteQuestionModel->add($_SESSION['user']['id'],$id_question);
                    echo 'voted';
                    break;
                case 'disvote':
                    $this->VoteQuestionModel->delete($_SESSION['user']['id'],$id_question);
                    echo 'disvoted';
                    break;
                default:
                    break;
            }
        }      
    }


    public function vote_answer()
    {
        if(!isset($_SESSION['user']))
        {
            http_response_code(401);
            echo 'Bạn phải đăng nhập để sử dụng chức năng này';
        }
        else
        {
            if(isset($_POST['id_answer']))
                $id_answer = $_POST['id_answer'];
            else
                http_response_code(500);

            if(isset($_POST['action']))
                $action = $_POST['action'];
            else
                http_response_code(500);

            switch ($action) {
                case 'vote':
                    $this->VoteAnswerModel->add($_SESSION['user']['id'],$id_answer);
                    echo 'voted';
                    break;
                case 'disvote':
                    $this->VoteAnswerModel->delete($_SESSION['user']['id'],$id_answer);
                    echo 'disvoted';
                    break;
                default:
                    break;
            }
        }
    }



    public function de_xuat_cau_tra_loi()
    {

        if(isset($_POST['slug']))
            $slug = $_POST['slug'];
        else
            http_response_code(500);

        $question = $this->QuestionModel->find($slug);

        if(count($question) == 0)
            http_response_code(404);

        $answer_question = $this->AnswerModel->findByIdQuestion($question[0]['id']);
        // nếu câu hỏi này chưa có câu trả lời thì cho máy đề xuất trả lời
        if(count($answer_question) == 0)
        {
            $tags = $this->TagModel->all();
            $answers = $this->AnswerModel->all();

            $i = 0;
            $samples = [];
            $targets = [];

            foreach ($answers as $answer) 
            {   
                $answers[$i]['label'] = 0;

                foreach ($tags as $tag) {
                    $num = substr_count(mb_strtolower($answer['title'],'UTF-8'),$tag['name']);
                    if($num > 0)
                        $answers[$i]['label'] += $num*$tag['id'];
                }

                array_push($samples,[ $answers[$i]['label'] ]);
                array_push($targets,$answer['id']);

                $i++;
            }

            $classifier = new NaiveBayes();
            $classifier->train($samples, $targets);


            $target = 0;
            foreach ($tags as $tag) {
                $num = substr_count(mb_strtolower($question[0]['title'],'UTF-8'),$tag['name']);
                if($num > 0)
                    $target += $num*$tag['id'];
                
            }

            $result = $classifier->predict([ $target ]);
            // echo "<pre>";
            // echo $result;
            // var_dump([$target ]);
            // echo "--------------------";
            // var_dump($samples);
            // echo "----------------------";
            // var_dump($targets);

            $data = $this->AnswerModel->find($result);
    
            if(isset($_SESSION['user']))
                $id_user = $_SESSION['user']['id'];
            else
                $id_user = -1;

            $i = 0;
            foreach ($data as $value) 
            {
                $vote_answer = $this->VoteAnswerModel->where($id_user,$value['id']);
                
                if(count($vote_answer) == 1)
                {
                    $data[$i]['voted'] = true;
                }
                else
                {
                    $data[$i]['voted'] = false;
                }
                $i++;
            }

            echo json_encode($data,JSON_UNESCAPED_UNICODE);
        }
    }


    public function test()
    {
       
        // $samples = [];
        // $labels = [];
        // $fn = 'vendor/tokenizer/train_question.txt';
        // $fh = fopen($fn, "r");
        // while(!feof($fh)) 
        // {
        //     $line = fgets($fh);
        //     $arr_data = explode(':', trim($line));
            
        //     $label = explode(' ',trim($arr_data[1]));
        //     array_push($labels,join('-',[ trim($arr_data[0]), $label[0] ]));

        //     $question = explode(' ',trim($arr_data[1]));
        //     array_shift($question);
        //     $question = join(' ',$question);
        //     array_push($samples,mb_strtolower($question,'UTF-8'));
        // }
        // fclose($fh);


        $samples = [
            'định_nghĩa nghĩa_là gì là_gì cái_gì',
            'tại_sao vì_sao làm_sao nghĩ_sao thì_sao sao thấy_sao lý_do lí_do nguyên_nhân',
            'bao_nhiêu có_mấy mấy',
            'thế_nào cách_nào như_nào',
            'nơi_nào chỗ_nào ở_đâu nơi_đâu ',
            'bao_giờ lúc_nào khi_nào thời_gian mấy_giờ',
            'ai người người_nào là_ai người_nào của_ai',
            'có_phải nên phải_không thật_không'
        ];

        $labels = [
            "khai_niem",
            "li_do",
            "so_luong",
            "cach_lam",
            "dia_diem",
            "thoi_gian",
            "ten_nguoi",
            "dung_sai"
        ];
        
        
        //chuyển về ma trận số
        $vectorizer = new TokenCountVectorizer(new WhitespaceTokenizer());
        $vectorizer->fit($samples);
        $vocabulary  = $vectorizer->getVocabulary();
        $vectorizer->transform($samples);

        //đếm tần xuất quan trọng
        $transformer = new TfIdfTransformer($samples);
        $transformer->transform($samples);

        // phân lớp
        $classifier = new NaiveBayes();
        $classifier->train($samples, $labels);

        // test
        $test = [
            'doanh_nghiệp abc thành_lập khi nào',
        ];
        $vectorizer->transform($test);
        $transformer->transform($test);

        $result = $classifier->predict($test);
        echo "<pre>";
        var_dump($result);
    }
}