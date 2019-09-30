<?php
	class VoteAnswerModel extends Model
	{
		public function __construct()
		{
			parent::__construct();
		}

		public function add($id_user,$id_answer)
		{
			$sql = "INSERT INTO vote_answer(id_user,id_answer) VALUES('$id_user','$id_answer')";
			$this->db->ExecuteNonQuery($sql);
		}

		public function delete($id_user,$id_answer)
		{
			$sql = "DELETE FROM vote_answer WHERE id_user = '$id_user' AND id_answer = '$id_answer'";
			$this->db->ExecuteNonQuery($sql);
		}

		public function all()
		{
			$sql = "SELECT * FROM vote_answer";
			return $this->db->Executequery($sql);
		}

		public function where($id_user,$id_answer)
		{
			$sql = "SELECT * FROM vote_answer WHERE id_user = '$id_user' AND id_answer = '$id_answer'";
			return $this->db->Executequery($sql);
		}
	}