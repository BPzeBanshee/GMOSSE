///@desc Deletes the config file from the save sandbox, then generates a new one.
function scr_config_reset() {
	var e = -1;
	var f1 = game_save_id+CONFIG_STR; // sandbox

	// Delete config.ini from sandbox
	e = file_delete(f1);
	if e != 1 show_message("Error deleting "+string(f1));
    
	// Loads up default values then saves them
	scr_config_load(CONFIG_STR);
	scr_config_save(CONFIG_STR);
}