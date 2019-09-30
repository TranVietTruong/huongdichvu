<?php
	class VoteQuestionModel extends Model
	{
		public function __construct()
		{
			parent::__construct();
		}

		public function add($id_user,$id_question)
		{
			$sql = "INSERT INTO vote_question(id_user,id_question) VALUES('$id_user','$id_question')";
			$this->db->ExecuteNonQuery($sql);
		}

		public function delete($id_user,$id_question)
		{
			$sql = "DELETE FROM vote_question WHERE id_user = '$id_user' AND id_question = '$id_question'";
			$this->db->ExecuteNonQuery($sql);
		}

		public function all()
		{
			$sql = "SELECT * FROM vote_question";
			return $this->db->Executequery($sql);
		}

		public function where($id_user,$id_question)
		{
			$sql = "SELECT * FROM vote_question WHERE id_user = '$id_user' AND id_question = '$id_question'";
			return $this->db->Executequery($sql);
		}
	}