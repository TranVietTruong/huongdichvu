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
					WHERE question.active = 1 LIMIT $trang,$question_display";
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

	}