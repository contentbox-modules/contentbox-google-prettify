/**
********************************************************************************
Copyright 2009 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author 	 :	Luis Majano
Description :

This modules allows you to insert code into your posts that will be prettifyed via
Google Prettify.  In order for this to work, the layouts must implement the "cbui_beforeBodyEnd"

https://github.com/google/code-prettify/

**/
component {

	// Module Properties
	this.title 				= "Google Prettify";
	this.author 			= "Ortus Solutions, Corp";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "Helps you embedd code into your pages and make them pretty";
	this.version			= "1.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "google-prettify";

	function configure(){

		// Compressor Settings
		settings = {

		};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// Interceptors
		interceptors = [
			{class="#moduleMapping#.interceptors.Prettify", name="prettify@google-prettify"}
		];

		// map utils
		binder.map("fileUtils@google-prettify").to("coldbox.system.core.util.FileUtils");
	}

	/**
	* CKEditor Integrations
	*/
	function cbadmin_ckeditorExtraPlugins(event, interceptData){
		arrayAppend( arguments.interceptData.extraPlugins, "cbGooglePrettify" );
	}

	/**
	* CKEditor Integrations
	*/
	function cbadmin_ckeditorToolbar(event, interceptData){
		var itemLen = arrayLen( arguments.interceptData.toolbar );
		for( var x =1; x lte itemLen; x++ ){
			if( isStruct(arguments.interceptData.toolbar[x])
			    AND arguments.interceptData.toolbar[x].name eq "contentbox" ){
				arrayAppend( arguments.interceptData.toolbar[x].items, "cbGooglePrettify");
				break;
			}
		}
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){

	}

	/**
	* Fired when the module is activated
	*/
	function onActivate(){
		// Install the ckeditor plugin
		var ckeditorPluginsPath = controller.getSetting("modules")["contentbox-admin"].path & "/modules/ckeditor/plugins/cbGooglePrettify";
		var fileUtils = controller.getWireBox().getInstance("fileUtils@google-prettify");
		var pluginPath = controller.getSetting("modules")["google-prettify"].path & "/includes/cbGooglePrettify";
		fileUtils.directoryCopy(source=pluginPath, destination=ckeditorPluginsPath);
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
	}

	/**
	* Fired when the module is deactivated by ContentBox Only
	*/
	function onDeactivate(){
		// Uninstall the ckeditor plugin
		var ckeditorPluginsPath = controller.getSetting("modules")["contentbox-admin"].path & "/modules/ckeditor/plugins/cbGooglePrettify";
		var fileUtils = controller.getWireBox().getInstance("fileUtils@google-prettify");
		fileUtils.directoryRemove(path=ckeditorPluginsPath, recurse=true);
	}
}
