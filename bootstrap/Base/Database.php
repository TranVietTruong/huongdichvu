<?php 
class Database
{
	private $_sql;
	private $_conn;
	public function __construct()
	{
		
	}

	public function SetQuery($sql)
	{
		$this->_sql = $sql;
	}

	public function Connect()
	{
		global $server;
		global $username;
		global $password;
		global $database;
		global $option;
		try 
		{
			$this->conn = new PDO("mysql:host=$server;dbname=$database",$username,$password,$option);
			$this->conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		} 
		catch (Exception $e) 
		{
			echo("không thể kết nối với database <br> ");
			echo $e->getMessage();
			die;
		}
	}

	public function Disconnect()
	{
		$this->conn = null;
	}

	public function Executequery($sql)
	{
		$this->Connect();
		$this->SetQuery($sql);
		
		$stmt = $this->conn->prepare($this->_sql);
		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		


		$this->Disconnect();
		return $result;
	}

	public function ExecuteNonQuery($sql)
	{
		$this->Connect();
		$this->SetQuery($sql);
		try
		{
			$result = $this->conn->prepare($this->_sql);
			$result->execute();
		}
		catch(Exception $e)
		{
			echo 'Câu truy vẫn lỗi hoặc bị lỗi đâu đó <br>';
			echo $e->getMessage();
			die;
		}
		$this->Disconnect();
	}


	public function ExecuteQueryReturnID($sql)
	{
		$this->Connect();
		$this->SetQuery($sql);
		try
		{
			$result = $this->_conn->prepare($this->_sql);
			$result->execute();
			$lastId = $this->_conn->lastInsertId();
			$this->Disconnect();
			return $lastId;
		}
		catch(Exception $e)
		{
			echo 'Câu truy vẫn lỗi hoặc bị lỗi đâu đó <br>';
			echo $e->getMessage();
			$this->Disconnect();
			die;
		}
	}
}