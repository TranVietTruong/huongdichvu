<?php 

class SloganController extends Controller
{
    /**
     * summary
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
    }


    public function addSlogan()
    {
        if(isset($_GET['aa']))
            echo $_GET['aa'];
        else
            echo 'string';
    }

    

}
