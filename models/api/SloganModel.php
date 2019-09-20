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
	}