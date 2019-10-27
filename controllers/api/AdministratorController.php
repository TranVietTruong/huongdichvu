<?php

class AdministratorController extends Controller
{
    /**
     * summary
     */
    public $AdministratorModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

       	include 'models/AdministratorModel.php';

        $this->AdministratorModel = new AdministratorModel();
    }

    public function getAll()
    {
        $data = $this->AdministratorModel->getAll();
        echo json_encode($data,JSON_UNESCAPED_UNICODE);
    }

    public function updateActive()
    {
        if(isset($_POST['id']))
            $id = $_POST['id'];
        $this->AdministratorModel->updateActive($id);
    }

    public function remove()
    {
        if(isset($_POST['id']))
            $id = $_POST['id'];
        $this->AdministratorModel->remove($id);
    }

    public function add()
    {
        if(isset($_POST['username']))
        {
          $username = $_POST['username'];
          $full_name = $_POST['full_name'];
          $email = $_POST['email'];
          $password = $_POST['password'];

          if(!$this->AdministratorModel->get_username($username)){
            $this->AdministratorModel->add($username, $full_name, $email, $password);
            $data["message"] = "Thêm thành công";
            $data["type"] = "success";
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
          }
          else{
            $data["message"] = "Tài khoản đã tồn tại";
            $data["type"] = "error";
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
          }
        }



    }


 }
