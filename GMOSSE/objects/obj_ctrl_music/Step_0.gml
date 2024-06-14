///@desc Fade/Alpha functions

if fading_out
	{
	if audio_sound_get_gain(channel) == 0
		{
		stop();
		fading_out = false;
		}
	}
if fading_in
	{
	var vol_max = round(global.music_volume)/100;
	if audio_sound_get_gain(channel) == vol_max fading_in = false;
	}
	
if showing_info && !instance_exists(obj_ctrl_pause)
	{
	timer += 1;
	if timer < 360 && alpha < 1 alpha += 0.01;
	if timer > 360
		{
		if alpha > 0 alpha -= 0.01 else showing_info = false;
		}
	}

// FADE OUT EFFECT
/*if fade_out == true && !fade_in
	{
	// get current volume, and start process
	var vol_current = round(global.music_volume)/100;
	if fade_value == -1
		{
		fade_value = vol_current;
		fade_song = music;
		}
		
	// if song changes, quit fade effect	
	if fade_song != music
		{
		fade_value = -1;
		fade_out = false;
		exit;
		}
	
	// decrement value relative to volume setting
	fade_value -= (vol_current * fade_amount);
	setVolumeMusic(music,max(0,fade_value));
	
	// and stop track when fully silent
	if fade_value <= 0
		{
		scr_stopmusic(music);
		fade_value = -1;
		fade_out = false;
		}
	}
	
// FADE IN EFFECT (CURRENTLY UNUSED)
if fade_in == true && !fade_out
	{
	// get current volume, and start process
	var vol_current = round(global.music_volume)/100;
	if fade_value == -1
		{
		fade_value = 0;
		fade_song = music;
		}
		
	// if song changes, quit fade effect
	if fade_song != music
		{
		fade_value = -1;
		fade_in = false;
		exit;
		}
	
	fade_value += (vol_current * fade_amount);
	setVolumeMusic(music,min(1,fade_value));
	
	if fade_value >= 1
		{
		fade_value = -1;
		fade_in = false;
		}
	}*/