///@desc scr_config_reset(location)
///@param {String} location
function scr_config_reset(location) {
	var e = -1;
	var f1 = working_directory+string(location); // sandbox

	// Delete config.ini from sandbox
	e = file_delete(f1);
	if e != 1 show_message("Error deleting "+string(f1));
    
	// Loads up default values then saves them
	scr_config_load(location); 
	scr_config_save(location);
	return 0;
}