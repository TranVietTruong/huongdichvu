<?php
class TagController extends Controller
{
    /**
     * summary
     */
    public $TagModel;

    public function __construct($param = NULL)
    {
        parent::__construct();

       	include 'models/TagModel.php';
        $this->TagModel = new TagModel();
    }

    public function get_all()
    {
    	$data = $this->TagModel->all();
    	echo json_encode($data,JSON_UNESCAPED_UNICODE);
    }
 }