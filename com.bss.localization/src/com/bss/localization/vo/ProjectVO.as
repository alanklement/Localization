package com.bss.localization.vo {
	[Bindable]
	[RemoteClass(alias="ProjectVO")]
	public class ProjectVO {
		public var project_id : int;
		public var project_name : String;
		public var project_edited : String;
		public var project_code : String;
		public var project_notes : String;
		public var project_created : String;
		public var project_language : int;
		public var edited_by : String;

		public function ProjectVO() {
		}
	}
}