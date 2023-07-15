/// @description scr_loadmusic(ini_section)
/// @param ini_section
/// @returns {real}
function scr_loadmusic(ini_section) {
	/* 
	scr_loadmusic(), by BPzeBanshee
	*/
	if !instance_exists(obj_ctrl_music) then exit;

	// Open INI file
	// (Ubuntu has problems with comment lines in INIs)
	if os_type == os_linux
		{
		var inistring = file_to_string(global.music_ini);
		if inistring != "ERROR" then ini_open_from_string(inistring);
		}
	else ini_open(global.music_ini);
	music_info[0] = ini_read_string(ini_section,"Path","NONE"); // file location
	music_info[1] = ini_read_real(ini_section,"Volume",100); // reads volume
	music_info[2] = real(ini_read_string(ini_section,"LoopStart","0")); // reads start of loop
	music_info[3] = real(ini_read_string(ini_section,"LoopEnd","1")); // reads end of loop
	ini_close();

	// quit early if no file to load
	if music_info[0] == "NONE" return -1; 

	// everything that's required is sorted, load and configure
	var m,a,b;
	m = audio_create_stream(music_info[0]);
	if m < 0 // Error check
	    {
	    trace("Error loading "+string(music_info[0])+", return code "+string(m));
	    return m;
	    }
		
	// Set volume
	audio_sound_gain(m,music_info[1]/100,0);
	
	// Set loop points
	var l = audio_sound_length(m);
	a = l * music_info[2];
	b = l * music_info[3];
	//trace("a: "+string(a)+", b: "+string(b));
	if a > 0 then audio_sound_loop_start(m,a);
	if b < 1 then audio_sound_loop_end(m,b);
	return m;
}