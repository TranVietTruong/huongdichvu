<?php

	class QuestionModel extends Model
	{
		public function __construct()
		{
			parent::__construct();
		}

		public function add($id_catagory,$id_user,$title,$slug,$content,$tag)
		{
			$sql = "INSERT INTO question(id_catagory,id_user,title,slug,content,tag) VALUES ('$id_catagory','$id_user','$title','$slug','$content','$tag')";
			$this->db->ExecuteNonQuery($sql);
		}


		public function all()
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1";
			return $this->db->Executequery($sql);
		}


		public function count()
		{
			$sql = "SELECT COUNT(*) AS count FROM question WHERE question.active = 1";
			return $this->db->Executequery($sql)[0]['count'];
		}

		public function paginate($trang,$question_display)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 
					ORDER BY created_at DESC
					LIMIT $trang,$question_display";
			return $this->db->Executequery($sql);
		}

		public function paginate_orderBy_view($trang,$question_display)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 
					ORDER BY view DESC
					LIMIT $trang,$question_display";
			return $this->db->Executequery($sql);
		}

		public function paginate_orderBy_vote($trang,$question_display)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 
					ORDER BY vote DESC
					LIMIT $trang,$question_display";
			return $this->db->Executequery($sql);
		}

		//*************************************************************
		public function count_paginate_inday()
		{
			$sql = "SELECT count(*) as count FROM question 
					WHERE question.active = 1 AND DAYOFYEAR(question.created_at) = DAYOFYEAR(CURDATE())";
			return $this->db->Executequery($sql)[0]['count'];
		}
		public function paginate_inday($trang,$question_display)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 AND DAYOFYEAR(question.created_at) = DAYOFYEAR(CURDATE())
					LIMIT $trang,$question_display";
			return $this->db->Executequery($sql);
		}
		//*****************************************************************
		public function count_paginate_inweek()
		{
			$sql = "SELECT count(*) as count FROM question 
					WHERE question.active = 1 AND WEEKOFYEAR(question.created_at) = WEEKOFYEAR(CURDATE())";
			return $this->db->Executequery($sql)[0]['count'];
		}
		public function paginate_inweek($trang,$question_display)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 AND WEEKOFYEAR(question.created_at) = WEEKOFYEAR(CURDATE())
					LIMIT $trang,$question_display";
			return $this->db->Executequery($sql);
		}
		//**************************************************************************

		public function count_paginate_inmonth()
		{
			$sql = "SELECT count(*) as count FROM question 
					WHERE question.active = 1 AND MONTH(question.created_at) = MONTH(CURDATE())";
			return $this->db->Executequery($sql)[0]['count'];
		}
		public function paginate_inmonth($trang,$question_display)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 AND MONTH(question.created_at) = MONTH(CURDATE())
					LIMIT $trang,$question_display";
			return $this->db->Executequery($sql);
		}


		public function find($slug)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 AND question.slug  = '$slug'";
			return $this->db->Executequery($sql);
		}

		public function find_by_user($id_user)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 AND question.id_user  = '$id_user' 
					ORDER BY question.created_at DESC";
			return $this->db->Executequery($sql);
		}

		public function update_view($id)
		{
			$sql = "UPDATE question SET view = view + 1 WHERE id = '$id'";
			$this->db->ExecuteNonQuery($sql);
		}

		public function find_by_tag($tag)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 AND question.tag  LIKE '%$tag%' AND question.title LIKE '%$tag%' 
					ORDER BY question.vote DESC,question.count_reply ASC";
			return $this->db->Executequery($sql);
		}


		public function order_by_time_and_count_reply()
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 ORDER BY question.vote DESC, question.count_reply ASC, question.created_at DESC LIMIT 5";
			return $this->db->Executequery($sql);
		}

		public function delete($id)
		{
			$sql = "UPDATE question SET active = 0 WHERE id = '$id'";
			$this->db->ExecuteNonQuery($sql);
		}

		public function like($keyword)
		{
			$sql = "SELECT * FROM question WHERE MATCH(title) AGAINST('$keyword' WITH QUERY EXPANSION) ORDER BY vote DESC LIMIT 5";
			return $this->db->Executequery($sql);
		}

		public function like_and_cate($id_catagory,$keyword)
		{
			$sql = "SELECT * FROM question WHERE id_catagory = '$id_catagory' AND MATCH(title) AGAINST('$keyword' WITH QUERY EXPANSION) ORDER BY vote DESC LIMIT 5";
			return $this->db->Executequery($sql);
		}


		public function search_no_cate($keyword)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 AND question.title LIKE '%$keyword%' ORDER BY question.vote DESC LIMIT 15";
			return $this->db->Executequery($sql);
		}

		public function search_cate($id_cate,$keyword)
		{
			$sql = "SELECT question.*,DATE_FORMAT(question.created_at, '%d/%m/%Y %H:%i') as time, user.full_name, catagory.name as catagory FROM question 
					INNER JOIN user ON question.id_user = user.id
					INNER JOIN catagory ON question.id_catagory = catagory.id
					WHERE question.active = 1 AND question.id_catagory = '$id_cate' AND question.title LIKE '%$keyword%' ORDER BY question.vote DESC LIMIT 15";
			return $this->db->Executequery($sql);
		}

	}