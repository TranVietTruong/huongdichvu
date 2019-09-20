<?php 

class SloganController extends Controller
{
    /**
     * summary
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
        include 'models/api/SloganModel.php';
    }


    public function addSlogan()
    {
        if(isset($_POST['author']))
            $author = $_POST['author'];
        else
        {
            http_response_code(500);
            echo 'Dữ liệu không hợp lệ';
        }

        if(isset($_POST['description']))
            $description = $_POST['description'];
        else
        {
            http_response_code(500);
             echo 'Dữ liệu không hợp lệ';
        }

        if(isset($_POST['slogan']))
            $slogan = $_POST['slogan'];
        else
        {
            http_response_code(500);
             echo 'Dữ liệu không hợp lệ';
        }

        $image = '';

        
        $target_dir = "public/upload/slogan/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);  // đường dẫn lưu file
        $uploadOk = 1;  // trạng thái thành công hay chưa

        // Kiểm tra xem tệp hình ảnh có phải là hình ảnh thực hay hình ảnh giả
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));  

        $check = getimagesize($_FILES["image"]["tmp_name"]);
        if($check !== false)  // nếu đúng thì ok
        {
            $uploadOk = 1;
        } 
        else  // nếu sai thì thông báo và trạng thái về 0
        {
            $uploadOk = 0;
            
        }
        // if (file_exists($target_file)) 
        // {
        //     $uploadOk = 0;
        // }
        // kiểm tra kích thước của file tối đa 50MB
        if ($_FILES["image"]["size"] > 50000000) 
        {
           
            $uploadOk = 0;
        }
        // Những định dạng file cho phép là jpg,png,jpeg,gif
        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) 
        {
            $uploadOk = 0;
            
        }

        if ($uploadOk == 0) 
        {

            http_response_code(500);
            echo 'Lỗi dữ liệu';
        } 
        else 
        {
            if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) 
            {
                $image = $_FILES["image"]["name"];
            } 
            else 
            {
                http_response_code(500);
                echo 'Lỗi dữ liệu';
            }
        }

        $sloganModel = new SloganModel();
        $sloganModel->addSlogan($author,$image,$description,$slogan);
       


    }
}
