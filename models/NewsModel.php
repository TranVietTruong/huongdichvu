<?php
	class NewsModel extends Model
	{
		public function __construct()
		{
			parent::__construct();
		}

		public function find_by_tag($tag)
		{
			$sql = "SELECT *,DATE_FORMAT(created_at, '%d/%m/%Y %H:%i') as time FROM news WHERE title LIKE '%$tag%'";
			return $this->db->Executequery($sql);
		}

		public function rand()
		{
			$sql = "SELECT *,DATE_FORMAT(created_at, '%d/%m/%Y %H:%i') as time FROM news ORDER BY RAND() LIMIT 6";
			return $this->db->Executequery($sql);
		}

	}