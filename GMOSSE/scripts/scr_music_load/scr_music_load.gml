/// @desc scr_music_load(ini_section)
/// @param ini_section
/// @returns {array}
function scr_music_load(ini_section) {
	/* 
	scr_music_load(), by BPzeBanshee
	*/

	// Create array and load metadata from INI
	var music_info = scr_music_load_metadata(ini_section);

	// quit early if no file to load (formerly 'NONE' check)
	if !is_array(music_info) then return -1;

	// everything that's required is sorted, load stream and configure
	var m,a,b;
	m = audio_create_stream(music_info[0]);
	if !audio_exists(m) // Error check
	    {
	    trace("Error loading "+string(music_info[0])+", return code "+string(m));
	    return music_info;
	    }
		
	// Set volume
	audio_sound_gain(m,music_info[1]/100,0);
	
	// Set loop points
	var l = audio_sound_length(m);
	a = l * music_info[2];
	b = l * music_info[3];
	if a > 0 then audio_sound_loop_start(m,a);
	if b < 1 then audio_sound_loop_end(m,b);
	
	// Finally, replace file string with audio ref and return the array
	music_info[0] = m;
	return music_info;
}