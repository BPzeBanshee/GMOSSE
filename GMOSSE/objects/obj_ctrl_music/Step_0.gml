AUpdate(); // Compulsory part of GMALP

// FADE OUT EFFECT (REPLACES OBJ_FADE)
if fade_out == true && !fade_in
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
		}
	
	// decrement value relative to volume setting
	fade_value -= (vol_current * fade_amount);
	AStreamSetVolume(music,max(0,fade_value));
	
	// and stop track when fully silent
	if fade_value <= 0
		{
		AStreamStop(music);
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
		}
	
	fade_value += (vol_current * fade_amount);
	AStreamSetVolume(music,min(1,fade_value));
	
	if fade_value >= 1
		{
		fade_value = -1;
		fade_in = false;
		}
	}