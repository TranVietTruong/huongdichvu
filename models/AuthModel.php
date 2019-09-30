<?php
	/**
	 * summary
	 */
	class AuthModel extends Model
	{
	    /**
	     * summary
	     */
	    public function __construct()
	    {
	        parent::__construct();
	    }

	    public function attempt($username,$password)
		{
			$sql  = "SELECT * FROM admin WHERE username = '$username' AND password = '$password'";
			$result = $this->db->Executequery($sql);
			return $result;
		}

		public function attempt_user($username)
		{
			$sql  = "SELECT * FROM user WHERE username = '$username'";
			$result = $this->db->Executequery($sql);
			return $result;
		}
	}