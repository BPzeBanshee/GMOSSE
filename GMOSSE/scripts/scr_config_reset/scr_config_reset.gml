/// @description scr_config_reset(location)
/// @param location
function scr_config_reset(argument0) {
	var e,f1;
	e = -1;
	f1 = working_directory+string(argument0); // sandbox

	// Delete config.ini from sandbox
	e = file_delete(f1);
	if e != 1 then show_message("Error deleting "+string(f1));
    
	// Loads up default values then saves them
	scr_config_load(argument0); 
	scr_config_save(argument0);
	return 0;



}
