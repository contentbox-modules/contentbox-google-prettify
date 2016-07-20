component extends="coldbox.system.Interceptor"{

	/**
	* cbui_beforeHeadEnd
	*/
	function cbui_beforeHeadEnd(event, interceptData){
		var modules = getSetting( "modules" );
		var modRoot = "";

		if( structKeyExists( modules, "google-prettify" ) ){
			modRoot = event.getModuleRoot( "Google-Prettify" );
		} else {
			modRoot = event.getModuleRoot( "contentbox-Google-Prettify" );
		}
		// add link and script
		appendToBuffer( '<link href="#modRoot#/includes/google-code-prettify/prettify.css" type="text/css" rel="stylesheet" />' );
		appendToBuffer( '<script type="text/javascript" src="#modRoot#/includes/google-code-prettify/prettify.js"></script>' );
		appendToBuffer( '<script type="text/javascript">$(document).ready(function(){
			prettyPrint();
		})</script>' );
	}

}