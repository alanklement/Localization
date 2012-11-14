<?php

class ProjectVO 
{
	var $project_id;
	var $project_name;
	var $project_code;
	var $project_notes;
	var $project_created;
	var $project_edited;
	var $project_language;

	//ak:
	var $edited_by;
	
	// explicit actionscript package
	
	var $_explicitType = "ProjectVO";
}