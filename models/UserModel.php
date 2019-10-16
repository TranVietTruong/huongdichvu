<?php
	/**
	 * summary
	 */
	class UserModel extends Model
	{
	    /**
	     * summary
	     */
	    public function __construct()
	    {
	        parent::__construct();
	    }

	    public function register($full_name,$email,$username,$password,$code_email)
	    {
	    	$sql = "INSERT INTO user(full_name,email,username,password,code_email) VALUES('$full_name','$email','$username','$password','$code_email')";
	    	$this->db->ExecuteNonQuery($sql);
	    }

	    public function where($column,$data)
	    {
	    	$sql = "SELECT * FROM user WHERE $column = '$data'";
	    	return $this->db->Executequery($sql);
	    }

	    public function verify_email($code_email)
	    {
	    	$sql = "UPDATE user SET email_verified = '1',code_email = NULL WHERE code_email = '$code_email'";
	    	return $this->db->ExecuteNonQuery($sql);
	    }

	    public function update_tag($id,$tag)
	    {
	    	$sql = "UPDATE user SET tag = '$tag' WHERE id = '$id'";
	    	return $this->db->ExecuteNonQuery($sql);
	    }

	    public function find($id)
	    {
	    	$sql = "SELECT * FROM user WHERE id = '$id'";
	    	return $this->db->Executequery($sql);
	    }

	    public function update_name($id,$name)
	    {
	    	$sql = "UPDATE user SET full_name = '$name' WHERE id = '$id'";
	    	return $this->db->ExecuteNonQuery($sql);
	    }

	    public function update_password($id,$newpass)
	    {
	    	$sql = "UPDATE user SET password = '$newpass' WHERE id = '$id'";
	    	return $this->db->ExecuteNonQuery($sql);
	    }

			public function count()
			{
				$sql = "SELECT COUNT(*) AS count FROM user";
				return $this->db->Executequery($sql)[0]['count'];
			}

			public function paginate($trang,$user_display)
			{
				$sql = "SELECT *,DATE_FORMAT(created_at, '%d/%m/%Y %H:%i') as time FROM user LIMIT $trang,$user_display";
				return $this->db->Executequery($sql);
			}

			public function updateActive($id)
			{
				$sql = "SELECT * FROM user WHERE id ='$id'";
				$user = $this->db->Executequery($sql)[0];
				if($user['active'] == 1)
				{
					$sql = "UPDATE user SET active = '0' WHERE id = '$id'";
					$this->db->ExecuteNonQuery($sql);
				}
				else
				{
					$sql = "UPDATE user SET active = '1' WHERE id = '$id'";
					$this->db->ExecuteNonQuery($sql);
				}

			}

			public function remove($id)
			{
				$sql = "DELETE user WHERE id = '$id'";
				$this->db->ExecuteNonQuery($sql);
			}

	}
