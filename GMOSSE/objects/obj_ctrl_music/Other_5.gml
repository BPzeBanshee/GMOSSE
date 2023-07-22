///@desc Stop tracks

// Stop the currently playing track
if room != rm_scores && global.nextroom != rm_scores
    {
    stop_all();
	if !LOAD_EVERYTHING
		{
		if is_array(music) then free(music[0]);
		if is_array(music2) then free(music2[0]);
	    music = -1;
		music2 = -1;
		}
	show_info(false);
    }
	
// Prepare the next stage's track
if !LOAD_EVERYTHING then load();