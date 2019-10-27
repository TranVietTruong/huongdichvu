<?php
	class AdministratorModel extends Model
	{
		public function __construct()
		{
			parent::__construct();
		}

		public function getAll()
		{
			$sql = "SELECT * FROM admin" ;
			return $this->db->Executequery($sql);
		}

		public function updateActive($id)
		{
			$sql = "SELECT * FROM admin WHERE id ='$id'";
			$user = $this->db->Executequery($sql)[0];
			if($user['active'] == 1)
			{
				$sql = "UPDATE admin SET active = '0' WHERE id = '$id'";
				$this->db->ExecuteNonQuery($sql);
			}
			else
			{
				$sql = "UPDATE admin SET active = '1' WHERE id = '$id'";
				$this->db->ExecuteNonQuery($sql);
			}
		}

		public function remove($id)
		{
			$sql = "DELETE FROM admin WHERE id = '$id'";
			return $this->db->ExecuteQuery($sql);
		}

		public function get_username($username)
		{
			$sql = "SELECT * FROM admin WHERE username = '$username'";
			return $this->db->ExecuteQuery($sql);
		}

		public function add($username, $full_name, $email, $password)
		{
			$sql = "INSERT INTO admin(username, full_name, email, password, active) VALUES ('$username', '$full_name', '$email', '$password', 1)";
			// $sql = "INSERT INTO admin(username, full_name, email, password, active) VALUES ('1', '1', '1', '1', '1')";
			return $this->db->ExecuteNonQuery($sql);
		}
	}
