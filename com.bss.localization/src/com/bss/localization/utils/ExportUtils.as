package com.bss.localization.utils {
	import com.bss.localization.model.ModelLocator;
	import com.bss.localization.vo.PhraseVO;

	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.system.System;

	import mx.collections.ArrayCollection;

	public class ExportUtils {
		public static function saveToClipBoard($array : ArrayCollection) : void {
			var tmpArray : ArrayCollection = $array ;

			var tmpString : String = "<html><head><title>Data Table</title></head><body><table>";

			tmpString += "<tr>";
			tmpString += "<td><b>Label</b></td>";
			tmpString += "<td><b>English</b></td>";
			tmpString += "<td><b>Limit</b></td>";
			tmpString += "<td><b>Current</b></td>";
			tmpString += "<td><b>Translation</b></td>";
			tmpString += "<td><b>Edited</b></td>";
			tmpString += "</tr>";

			for (var i : int = 0; i < tmpArray.length; i++) {
				var current : String = tmpArray[i].phrase_translation ;
				var currnetLength : String = '0' ;
				var translation : String = '' ;

				var edited : String = tmpArray[i].phrase_edited ;

				if ( tmpArray[i].phrase_translation == 'null' ) {
					translation = '-' ;
				} else {
					translation = tmpArray[i].phrase_translation ;
				}
				if ( current == null ) {
					currnetLength = '-' ;
				} else {
					currnetLength = current.length.toString() ;
				}

				if ( edited == null ) {
					edited = '-' ;
				}

				tmpString += "<tr>";
				tmpString += "<td>" + tmpArray[i].label_name + "</td>";
				tmpString += "<td>" + tmpArray[i].phrase_original + "</td>";
				tmpString += "<td>" + tmpArray[i].label_char_limit + "</td>";
				tmpString += "<td>" + currnetLength + "</td>";
				tmpString += "<td>" + tmpArray[i].phrase_translation + "</td>";
				tmpString += "<td>" + edited + "</td>";
				tmpString += "</tr>";
			}

			tmpString += "</table></body></html>"
			System.setClipboard(tmpString);
		}

		public static function exportAdminCSV($langCode : String) : void {
			var TSVString : String = "";

			TSVString += "Label" + ",";
			TSVString += "English" + ",";
			TSVString += "Limit" + ",";
			TSVString += "Translation" + ",";
			TSVString += "Edited" + ",";

			TSVString += "," + "," + "," + "," + "," + "\n" + "\n" ;

			for each ( var phraseVO:PhraseVO in ModelLocator.getInstance().returnedPhraseProjectLang ) {
				TSVString += '"' + phraseVO.label_name + '"' + ",";
				TSVString += '"' + phraseVO.phrase_original + '"' + ",";
				TSVString += '"' + phraseVO.label_char_limit + '"' + ",";

				if (phraseVO.phrase_translation == null) {
					TSVString += '"' + " - " + '"' + "," ;
				} else {
					TSVString += '"' + phraseVO.phrase_translation + '"' + "," ;
				}

				if ( phraseVO.phrase_edited == null ) {
					TSVString += " - " + "\n" ;
				} else {
					TSVString += phraseVO.phrase_edited + "\n" ;
				}
			}

			var v : URLVariables = new URLVariables() ;
			v.projectCode = ModelLocator.getInstance().selectedCopyDeckProject.project_code ;
			v.languageCode = $langCode /* projectLangCB.selectedItem.language_code */ ;
			v.tsvString = TSVString ;

			var request : URLRequest = new URLRequest(ModelLocator.EXPORT_SERVICE_URL) ;
			request.method = URLRequestMethod.POST ;
			request.data = v ;

			trace(TSVString) ;
			var _fileRef : FileReference = new FileReference() ;
			_fileRef.download(request, v.projectCode + "_" + v.languageCode + ".csv") ;
		}
	}
}