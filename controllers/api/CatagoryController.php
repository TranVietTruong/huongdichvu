<?php 

class CatagoryController extends Controller
{
    /**
     * summary
     */
    public $catagoryModel;

    public function __construct($param = NULL)
    {
        parent::__construct();
        include 'models/api/CatagoryModel.php';
        $this->catagoryModel = new CatagoryModel();
    }
    public function getAllCatagory()
    {
        $data = $this->catagoryModel->all();
        echo json_encode($data,JSON_UNESCAPED_UNICODE);
    }

    public function addCatagory()
    {
        if(isset($_POST['name']))
            $name = $_POST['name'];
        else
            http_response_code(500);

        $image = '';
        $target_dir = "public/upload/catagory/";
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

        $this->catagoryModel->add($image,$name);
    }

    public function getCurrentCatagory()
    {
        if(isset($_POST['id']))
            $id = $_POST['id'];
        $catagory = $this->catagoryModel->find($id);
        if(!empty($catagory))
        {
            echo json_encode($catagory,JSON_UNESCAPED_UNICODE);
        }
        else
            http_response_code(404);
    }

    public function updateImage()
    {
        if(isset($_POST['id']))
        {
            $id = $_POST['id'];
        }
        else
            http_response_code(500);

        $catagory = $this->catagoryModel->find($id);
        if(file_exists($catagory['image']) && !empty($catagory['image']))
        {
            unlink($catagory['image']);
        }

        $image = '';

        
        $target_dir = "public/upload/catagory/";
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

        $this->catagoryModel->updateImage($id,$image);

        echo json_encode($image);
    }

    public function updateName()
    {
        if(isset($_POST['id']))
            $id = $_POST['id'];
        else
            http_response_code(500);

        if(isset($_POST['name']))
            $name = $_POST['name'];
        else
            http_response_code(500);

        $this->catagoryModel->updateName($id,$name);
    }

    public function removeCatagory()
    {
         if(isset($_POST['id']))
            $id = $_POST['id'];
        else
            http_response_code(500);

        $catagory = $this->catagoryModel->find($id);
        if(file_exists($catagory['image']) && !empty($catagory['image']))
        {
            unlink($catagory['image']);
        }
        $this->catagoryModel->removeCatagory($id);
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

        $this->catagoryModel->updateRank($id,$rank);
    }

}
