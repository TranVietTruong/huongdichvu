<?php
	class SearchModel extends Model
	{
		public function __construct()
	    {
	        parent::__construct();
	    }

	    public function like($keyword)
	    {
	    	$sql = "SELECT * FROM search WHERE search.keyword LIKE '%$keyword%' LIMIT 5";
	    	return $this->db->Executequery($sql);
	    }
	}