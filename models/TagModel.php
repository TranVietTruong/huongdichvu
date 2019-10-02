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

	    public function get_random_tag()
	    {
	    	$sql = "SELECT DISTINCT * FROM tag ORDER BY RAND() LIMIT 10";
	    	return $this->db->Executequery($sql);
	    }

	    public function like($string)
	    {
	    	$sql = "SELECT DISTINCT * FROM tag WHERE name like '%$string%'";
	    	return $this->db->Executequery($sql);
	    }

	    public function update_total($id)
	    {
	    	$sql = "UPDATE tag SET total = total + 1 WHERE id = $id";
	    	$this->db->ExecuteNonQuery($sql);
	    }

	    public function find_by_name($name)
	    {
	    	$sql = "SELECT DISTINCT * FROM tag WHERE name = '$name'";
	    	return $this->db->Executequery($sql);
	    }

	}