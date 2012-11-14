<?php
require_once( "./vo/LoginVO.php" );
require_once( "./vo/ProjectVO.php" );           
include_once( "./utils/connect.php" );
require_once("./utils/ResultUtils.php");

class LoginService
{
	// ak: For now, our setup is you're either an admin with complete access, or a client, with access to one project.
	// I decided to  assign admins a project ID of 0 - because a project in a MySQL datbase will never have an ID of 0.
	const __ADMIN		= 0 ;
	
	public function __construct() {}
	
	public function login( $loginVO )
	{			
		// ak: take apart Value Object
		$username 	= $loginVO[ "username" ] ;
		$password 	= $loginVO[ "password" ] ;
		$date 		= date( "Y-m-d H:i", time() ) ;
		$utils 		= new ResultUtils() ;

		$user = mysql_fetch_assoc( mysql_query( "SELECT * FROM user WHERE username='$username' LIMIT 1" ) ) ;
		if( !$user )
		{
			$result = $utils->fail( "Error: User not found." ) ;
		}
		else if( $user[ "password" ] != $password )
		{
			$result = $utils->fail( "Error: Incorrect password for this user." ) ;			
		}
		else
		{
			$returnedUserID = $user["id"] ;			

			// ak: Keep track of last login.
			$loginTimeStamp = mysql_query( "UPDATE user SET last_login='$date' WHERE id='$returnedUserID'" ) ;
			
			$project = mysql_fetch_assoc( mysql_query( "SELECT * FROM user_project WHERE user_id = '$returnedUserID' LIMIT 1" ) ) ;
			if( !$project )
			{
				$result = $utils->fail( "Error: No projects found for this user." ) ;
			}
			else
			{			
				$returnedProjectID = $project["project_id"] ; 
				
				// ak: An admin login will return all projects, a client will only return one.
				if( $returnedProjectID == self::__ADMIN ) $getProjectQuery = "SELECT * FROM project" ;
				else $getProjectQuery = "SELECT * FROM project WHERE id = '$returnedProjectID'" ;
				if( !$getProjectQuery )
				{
					$result = $utils->fail( "Error: Could not retrieve projects for user." ) ;
				}
				
				$query = mysql_query($getProjectQuery) ;
				$result = $utils->createProjectResultVOs( $query ) ;				
			}
		}
		return $result ;
	}
}