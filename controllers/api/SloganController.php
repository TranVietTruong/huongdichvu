<?php 

class SloganController extends Controller
{
    /**
     * summary
     */
    public $sloganModel;

    public function __construct($param = NULL)
    {
        parent::__construct();
        include 'models/SloganModel.php';
        $this->sloganModel = new SloganModel();
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
        $target_file = $target_dir . mt_rand().basename($_FILES["image"]["name"]);  // đường dẫn lưu file
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
        if (file_exists($target_file)) 
        {
            $uploadOk = 0;
        }
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
                $image = $target_file;
            } 
            else 
            {
                http_response_code(500);
                echo 'Lỗi dữ liệu';
            }
        }

        
        $this->sloganModel->addSlogan($author,$image,$description,$slogan);
    }

    public function getAllSlogan()
    {
        $data = $this->sloganModel->all();
        echo json_encode($data,JSON_UNESCAPED_UNICODE);
    }

    public function updateActive()
    {
        if(isset($_POST['id']))
            $id = $_POST['id'];
        $this->sloganModel->updateActive($id);
    }

    public function removeSlogan()
    {
        if(isset($_POST['id']))
            $id = $_POST['id'];
        $image = $this->sloganModel->removeSlogan($id);
        if(file_exists($image) && !empty($image))
        {
            unlink($image);
        }
    
    }

    public function getCurrentSlogan()
    {
        if(isset($_POST['id']))
            $id = $_POST['id'];
        $slogan = $this->sloganModel->getCurrent($id);
        if(!empty($slogan))
        {
            echo json_encode($slogan,JSON_UNESCAPED_UNICODE);
        }
        else
            http_response_code(404);
    }

    public function updateSlogan()
    {
        if(isset($_POST['id']))
        {
            $id = $_POST['id'];
        }

        if(isset($_POST['author']))
            $author = $_POST['author'];
        else
            http_response_code(500);

       
        if(isset($_POST['description']))
            $description = $_POST['description'];
        else
            http_response_code(500);

        if(isset($_POST['content']))
            $content = $_POST['content'];
        else
            http_response_code(500);

        $this->sloganModel->update($id,$author,$description,$content);
    }

    public function updateImage()
    {
        if(isset($_POST['id']))
        {
            $id = $_POST['id'];
        }

        $slogan = $this->sloganModel->find($id);
        if(file_exists($slogan['image']) && !empty($slogan['image']))
        {
            unlink($slogan['image']);
        }

        $image = '';

        
        $target_dir = "public/upload/slogan/";
        $target_file = $target_dir .mt_rand(). basename($_FILES["image"]["name"]);  // đường dẫn lưu file
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
        if (file_exists($target_file)) 
        {
            $uploadOk = 0;
        }
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
            echo json_encode(['message' => 'Lỗi dữ liệu'],JSON_UNESCAPED_UNICODE);
        } 
        else 
        {
            if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) 
            {
                $image = $target_file;
            } 
            else 
            {
                http_response_code(500);
                echo json_encode(['message' => 'Lỗi dữ liệu'],JSON_UNESCAPED_UNICODE);
            }
        }

        $this->sloganModel->updateImage($id,$image);

        echo json_encode($image);

    }

    public function updateRank()
    {
        if(isset($_POST['id']))
            $id = $_POST['id'];
        else
            http_response_code(500);

        if(isset($_POST['rank']))
            $rank = $_POST['rank'];
        else
            http_response_code(500);
        if(empty($rank))
            $rank = 'null';

        $this->sloganModel->updateRank($id,$rank);

    }
}
