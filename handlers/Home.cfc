component{

	// DI
	property name="settingService" 	inject="settingService@cb";
	property name="cb" 				inject="cbHelper@cb";

	function entry(event,rc,prc){
		// view
		event.setView(view="home/entry")
			.setLayout(name="ajax", module="contentbox-admin");
	}

}