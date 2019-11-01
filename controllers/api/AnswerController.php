<?php
class AnswerController extends Controller
{
    /**
     * summary
     */
    public $AnswerModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

       	include 'models/AnswerModel.php';
        $this->AnswerModel = new AnswerModel();
    }

    public function updateActive()
    {
        if(isset($_POST['id']))
        {
          $id = $_POST['id'];
          $this->AnswerModel->updateActive($id);
        }
    }

    public function remove()
    {
      if(isset($_POST['id']))
      {
        $id = $_POST['id'];
        $this->AnswerModel->delete($id);
      }
    }
 }
