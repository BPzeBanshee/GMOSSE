///@desc Stop tracks

// Stop the currently playing track
stop_all();
if !LOAD_EVERYTHING
	{
	if is_array(music) free(music[0]);
	if is_array(music2) free(music2[0]);
	music = -1;
	music2 = -1;
	}
show_info(false);
	
// Prepare the next stage's track
if !LOAD_EVERYTHING load();