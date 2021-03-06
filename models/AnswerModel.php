<?php

	class AnswerModel extends Model
	{
		public function __construct()
		{
			parent::__construct();
		}


		public function findByIdQuestion($id)
		{
			$sql = "SELECT answer.*,DATE_FORMAT(answer.created_at, '%d/%m/%Y %H:%i') as time, user.full_name
					FROM answer
					INNER JOIN user ON answer.id_user = user.id
					INNER JOIN question ON answer.id_question = question.id
					WHERE answer.active = 1 AND answer.id_question  = '$id'
					ORDER BY question.vote DESC";
			return $this->db->Executequery($sql);
		}


		public function add($id_question,$id_user,$content,$content_text,$tag)
		{
			$sql = "INSERT INTO answer(id_question,id_user,content,content_text,tag) VALUES ('$id_question','$id_user','$content','$content_text','$tag')";
			return $this->db->ExecuteQueryReturnID($sql);
		}

		public function find($id)
		{
			$sql = "SELECT answer.*,DATE_FORMAT(answer.created_at, '%d/%m/%Y %H:%i') as time, user.full_name
					FROM answer
					INNER JOIN user ON answer.id_user = user.id
					INNER JOIN question ON answer.id_question = question.id
					WHERE answer.active = 1 AND answer.id  = '$id'";
			return $this->db->Executequery($sql);
		}

		public function find_by_id_user($id)
		{
			$sql = "SELECT answer.*,DATE_FORMAT(answer.created_at, '%d/%m/%Y %H:%i') as time, user.full_name,question.title,question.slug
					FROM answer
					INNER JOIN user ON answer.id_user = user.id
					INNER JOIN question ON answer.id_question = question.id
					WHERE answer.active = 1 AND answer.id_user  = '$id'";
			return $this->db->Executequery($sql);
		}

		public function delete($id)
		{
			$sql = "DELETE FROM answer WHERE id = '$id'";
			$this->db->ExecuteNonQuery($sql);
		}

		public function updateActive($id)
		{
			$sql = "SELECT * FROM answer WHERE id ='$id'";
			$answer = $this->db->Executequery($sql)[0];
			if($answer['active'] == 1)
			{
				$sql = "UPDATE answer SET active = '0' WHERE id = '$id'";
				$this->db->ExecuteNonQuery($sql);
			}
			else
			{
				$sql = "UPDATE answer SET active = '1' WHERE id = '$id'";
				$this->db->ExecuteNonQuery($sql);
			}
		}

		// =============================  ĐỀ XUẤT CÂU HỎI ============================
		public function choncathe()
		{
			$sql = "SELECT answer.*,DATE_FORMAT(answer.created_at, '%d/%m/%Y %H:%i') as time,question.id_catagory,question.title,user.full_name FROM answer
					INNER JOIN user ON answer.id_user = user.id
					INNER JOIN question ON answer.id_question = question.id";
			return $this->db->Executequery($sql);
		}

		public function all()
		{
			$sql = "SELECT answer.*,DATE_FORMAT(answer.created_at, '%d/%m/%Y %H:%i') as time,question.id_catagory,question.title,user.full_name FROM answer
					INNER JOIN user ON answer.id_user = user.id
					INNER JOIN question ON answer.id_question = question.id";
			return $this->db->Executequery($sql);		
		}

		public function get_target($id)
		{
			$sql = "SELECT answer.*,DATE_FORMAT(answer.created_at, '%d/%m/%Y %H:%i') as time,question.id_catagory,question.title,user.full_name FROM answer
					INNER JOIN user ON answer.id_user = user.id
					INNER JOIN question ON answer.id_question = question.id
					WHERE answer.id < '$id' ORDER BY answer.id DESC LIMIT 1";
			return $this->db->Executequery($sql);	
		}
		public function get_target2($id)
		{
			$sql = "SELECT answer.*,DATE_FORMAT(answer.created_at, '%d/%m/%Y %H:%i') as time,question.id_catagory,question.title,user.full_name FROM answer
					INNER JOIN user ON answer.id_user = user.id
					INNER JOIN question ON answer.id_question = question.id
					WHERE answer.id > '$id' LIMIT 1";
			return $this->db->Executequery($sql);	
		}
		// ============================= END =========================================
	}
