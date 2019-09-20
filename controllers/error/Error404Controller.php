<?php 

class Error404Controller extends Controller
{
    /**
     * summary
     */
    public function __construct($param = NULL)
    {
        parent::__construct();
    }

    public function error404()
    {
        $this->view->Render('admin/404');
    }
}

