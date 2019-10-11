<?php

	class CatagoryModel extends Model
	{
		public function __construct()
		{
			parent::__construct();
		}

		public function add($image,$name,$slug)
		{
			$sql = "INSERT INTO catagory(image,name,slug) VALUES ('$image','$name','$slug')";
			$this->db->ExecuteNonQuery($sql);
		}

		public function all()
		{
			$sql = "SELECT * FROM catagory ORDER BY rank ASC";
			$result = $this->db->Executequery($sql);
			return $result;
		}

		public function find($id)
		{
			$sql = "SELECT * FROM catagory WHERE id = '$id'";
			$result = $this->db->Executequery($sql)[0];
			return $result;
		}

		public function find_by_slug($slug)
		{
			$sql = "SELECT * FROM catagory WHERE slug = '$slug'";
			return $this->db->Executequery($sql)[0];
		}

		public function updateImage($id,$image)
		{
			$sql = "UPDATE catagory SET image = '$image' WHERE id = '$id'";
			$this->db->ExecuteNonQuery($sql);
		}

		public function updateName($id,$name,$slug)
		{
			$sql = "UPDATE catagory SET name = '$name', slug = '$slug' WHERE id = '$id'";
			$this->db->ExecuteNonQuery($sql);
		}

		public function removeCatagory($id)
		{
			$sql = "DELETE FROM catagory WHERE id = '$id'";
			$this->db->ExecuteNonQuery($sql);
		}

		public function updateRank($id,$rank)
		{
			if($rank == 'null')
			{
				$sql = "UPDATE catagory SET rank = NULL WHERE id = '$id'";
			}
			else
			{
				$sql = "UPDATE catagory SET rank = '$rank' WHERE id = '$id'";
			}
			$this->db->ExecuteNonQuery($sql);
		}

	}