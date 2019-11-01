<?php
	class SearchModel extends Model
	{
		public function __construct()
	    {
	        parent::__construct();
	    }

	    public function like($keyword)
	    {
	    	$sql = "SELECT * FROM search WHERE MATCH(keyword) AGAINST('+$keyword') LIMIT 10";
	    	return $this->db->Executequery($sql);
	    }

	    public function add($keyword,$species)
	    {
	    	$sql = "INSERT INTO search(keyword,species) VALUES('$keyword','$species')";
	    	return $this->db->ExecuteNonQuery($sql);
	    }

	   	public function all()
	   	{
	   		$sql = "SELECT * FROM search";
	   		return $this->db->Executequery($sql);
	   	}

	   	public function update($id)
	   	{
	   		$sql = "UPDATE search SET total = total + 1 WHERE id = '$id'";
	   		return $this->db->ExecuteNonQuery($sql);
	   	}

	   	public function where($column,$data)
	   	{
	   		$sql = "SELECT * FROM search WHERE $column = '$data'";
	   		return $this->db->Executequery($sql);
	   	}
	}