/**
********************************************************************************
Copyright 2009 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author 	 :	Luis Majano
Description :

This modules allows you to insert code into your posts that will be prettifyed via
Google Prettify.  In order for this to work, the layouts must implement the "cbui_beforeBodyEnd"

http://google-code-prettify.googlecode.com/svn/trunk/README.html

**/
component extends="coldbox.system.Interceptor"{

	/**
	* cbui_beforeHeadEnd
	*/
	function cbui_beforeHeadEnd(event, interceptData){
		var modRoot = event.getModuleRoot("google-prettify");
		// add link and script
		appendToBuffer('<link href="#modRoot#/includes/google-code-prettify/prettify.css" type="text/css" rel="stylesheet" />');
		appendToBuffer('<script type="text/javascript" src="#modRoot#/includes/google-code-prettify/prettify.js"></script>');
		appendToBuffer('<script type="text/javascript">$(document).ready(function(){
			prettyPrint();
		})</script>');
	}

}