<?php 
class ContactController extends Controller
{
    /**
     * summary
     */
  
    public function __construct($param = NULL)
    {
        parent::__construct();
    }

    public function contact()
    { 
        $this->view->Render('client/head');
        $this->view->Render('client/header');
        $this->view->Render('client/contact/banner');
        $this->view->Render('client/contact/contact');
        $this->view->Render('client/footer');
    }
}
