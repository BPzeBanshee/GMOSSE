///@desc Stop tracks

// Stop the currently playing track
stop_all();
if !LOAD_EVERYTHING
	{
	unload();
	
	if (global.nextroom == rm_menu
	or global.nextroom == rm_shipselect)
	&& aux_loaded
	unload_aux();
	}
show_info(false);
	
// Prepare the next stage's track
if !LOAD_EVERYTHING load();