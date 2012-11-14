<?php

class LabelVO 
{
	var $project_id ;
	var $project_name ;
	var $label_id ;
	var $label_name ;
	var $label_char_limit ;
	var $phrase_original;
	var $phrase_translation_id ;
	var $phrase_translation ;
	var $label_created ;
	var $label_edited ;
	
	//ak:
	var $edited_by ;
	
	// explicit actionscript package
	
	var $_explicitType = "LabelVO" ;
}