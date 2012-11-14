<?php
require_once("./vo/UserVO.php");

include_once("./utils/connect.php");

class UserService
{
	public function __construct(){}
	
	public function getAllUser()
	{
		$resultObj = array();
		
		$query = mysql_query("SELECT * FROM user, user_project WHERE user.id = user_project.user_id");
		
		if(!$query)
		{
			$resultObj["success"] = false;
			$resultObj["message"] = "Query Failed";
		}
		else
		{
			$users = array();
			
			while($row = mysql_fetch_array($query))
			{
				$user			  		=	new UserVO();
				$user->id		  		=	$row['id'];
				$user->username	  		=	$row['username'];
				$user->password	  		=	$row['password'];
				$user->usertype_id		=	$row['usertype_id'];
				$user->last_login		=	$row['last_login'];
				$user->user_id			=	$row['user_id'];
				$user->project_id		=	$row['project_id'];
				
				$users[] = $user; 
			}
			
			$resultObj["success"]	= true;
			$resultObj["users"]		= $users;
			
		}
		
		return $resultObj;
	}
}

?>