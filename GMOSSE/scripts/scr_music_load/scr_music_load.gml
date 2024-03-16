/// @desc scr_music_load(json_section)
/// @param json_section
function scr_music_load(json_section) {
	/* 
	scr_music_load(), by BPzeBanshee
	*/
	
	// Pick INI or JSON file
	var mystruct = -2;
	var myini = global.music_ini;
	if file_exists(myini)
		{
		mystruct = scr_music_load_ini(json_section);
		}
	else if file_exists(filename_change_ext(myini,".json"))
		{
		mystruct = scr_music_load_json(json_section);
		}
	else trace("File not found");

	// quit early if no file to load (formerly 'NONE' check)
	if !is_struct(mystruct) {
	trace("Error loading JSON, error code "+string(mystruct));
	return -1;
	}
	
	//show_message(mystruct);
	
	var music_info = ["",100,0,1,"","",""];
	if variable_struct_exists(mystruct,"Path")			music_info[0] = mystruct.Path;
	if variable_struct_exists(mystruct,"Volume")		music_info[1] = mystruct.Volume;
	if variable_struct_exists(mystruct,"LoopStart")		music_info[2] = mystruct.LoopStart;
	if variable_struct_exists(mystruct,"LoopEnd")		music_info[3] = mystruct.LoopEnd;
	if variable_struct_exists(mystruct,"Title")			music_info[4] = mystruct.Title;
	if variable_struct_exists(mystruct,"Game")			music_info[5] = mystruct.Game;
	if variable_struct_exists(mystruct,"Artist")		music_info[6] = mystruct.Artist;

	// everything that's required is sorted, load stream and configure
	var m = audio_create_stream(mystruct.Path);
	if !audio_exists(m) // Error check
	    {
	    trace("Error loading "+string(mystruct.Path)+", return code "+string(m));
	    return -2;
	    }
		
	// Set volume
	audio_sound_gain(m,mystruct.Volume/100,0);
	
	// Set loop points
	var l = audio_sound_length(m);
	
	var a = l * mystruct.LoopStart;
	var b = l * mystruct.LoopEnd;
	if a > 0 then audio_sound_loop_start(m,a);
	if b < 1 then audio_sound_loop_end(m,b);
	
	// Finally, replace file string with audio ref and return the array
	music_info[0] = m;
	return music_info;
}

/// @desc scr_music_load_old(ini_section)
/// @param ini_section
/*function scr_music_load_old(ini_section) {
	//scr_music_load(), by BPzeBanshee

	// Create array and load metadata from INI
	var music_info = scr_music_load_metadata(ini_section);

	// quit early if no file to load (formerly 'NONE' check)
	if !is_array(music_info) then return -1;

	// everything that's required is sorted, load stream and configure
	var m = audio_create_stream(music_info[0]);
	if !audio_exists(m) // Error check
	    {
	    trace("Error loading "+string(music_info[0])+", return code "+string(m));
	    return music_info;
	    }
		
	// Set volume
	audio_sound_gain(m,music_info[1]/100,0);
	
	// Set loop points
	var l = audio_sound_length(m);
	var a = l * music_info[2];
	var b = l * music_info[3];
	if a > 0 then audio_sound_loop_start(m,a);
	if b < 1 then audio_sound_loop_end(m,b);
	
	// Finally, replace file string with audio ref and return the array
	music_info[0] = m;
	return music_info;
}*/