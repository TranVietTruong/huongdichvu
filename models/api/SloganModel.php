<?php
	/**
	 * summary
	 */
	class SloganModel extends Model
	{
	    /**
	     * summary
	     */
	    public function __construct()
	    {
	        parent::__construct();
	    }

	    public function addSlogan($author,$image,$description,$slogan)
		{

			$sql = "INSERT INTO `slogan` (`id`, `author`, `image`, `description`, `content`, `post_by`, `rank`, `active`, `created_at`, `updated_at`) VALUES (NULL, '$author', '$image', '$description', '$slogan','".$_SESSION['admin']['full_name']."', NULL, '1',NULL,NULL)";

			$this->db->ExecuteNonQuery($sql);
		}

		public function all()
		{
			$sql = 'SELECT * FROM slogan';
			$result = $this->db->Executequery($sql);
			return $result;
		}

		public function updateActive($id)
		{
			$sql = "SELECT * FROM slogan WHERE id ='$id'";
			$slogan = $this->db->Executequery($sql)[0];
			if($slogan['active'] == 1)
			{
				$sql = "UPDATE slogan SET active = '0' WHERE id = '$id'";
				$this->db->ExecuteNonQuery($sql);
			}
			else
			{
				$sql = "UPDATE slogan SET active = '1' WHERE id = '$id'";
				$this->db->ExecuteNonQuery($sql);
			}

		}

		public function removeSlogan($id)
		{
			$sql = "SELECT * FROM slogan WHERE id = '$id'";
			$slogan = $this->db->Executequery($sql);

			$sql = "DELETE FROM slogan WHERE id = '$id'";
			$this->db->ExecuteNonQuery($sql);
			return $slogan[0]['image'];
		}

		public function getCurrent($id)
		{
			$sql = "SELECT * FROM slogan WHERE id = '$id'";
			$result = $this->db->Executequery($sql);
			return $result;
		}

		public function update($id,$author,$description,$content)
		{
			$sql = "UPDATE slogan SET author = '$author', description = '$description', content = '$content' WHERE id = '$id'";
			$this->db->ExecuteNonQuery($sql);
		}

		public function updateImage($id,$image)
		{
			$sql = "UPDATE slogan SET image = '$image' WHERE id = '$id'";
			$this->db->ExecuteNonQuery($sql);
		}

		public function find($id)
		{
			$sql = "SELECT * FROM slogan WHERE id = '$id'";
			$result = $this->db->Executequery($sql)[0];
			return $result;
		}

		public function updateRank($id,$rank)
		{
			if($rank == 'null')
			{
				$sql = "UPDATE slogan SET rank = NULL WHERE id = '$id'";
			}
			else
			{
				$sql = "UPDATE slogan SET rank = '$rank' WHERE id = '$id'";
			}
			$this->db->ExecuteNonQuery($sql);
		}
	}