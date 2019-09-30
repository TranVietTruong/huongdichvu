<?php
	class TagModel extends Model
	{
		public function __construct()
	    {
	        parent::__construct();
	    }

	    public function add($name)
	    {
	    	$sql = "INSERT INTO tag(name) VALUES('$name')";
	    	$this->db->ExecuteNonQuery($sql);
	    }

	    public function all()
	    {
	    	$sql = "SELECT DISTINCT * FROM tag";
	    	return $this->db->Executequery($sql);
	    }
	}