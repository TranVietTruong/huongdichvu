<?php
	/**
	 * summary
	 */
	class User extends Model
	{
	    /**
	     * summary
	     */
	    public function __construct()
	    {
	        parent::__construct();
	    }
	    public function getUser()
		{
			$sql = "SELECT * FROM user";
			$result = $this->db->Executequery($sql);
			return $result;
		}
	}