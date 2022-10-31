/// @description scr_loadmusic(ini_section)
/// @param ini_section
function scr_loadmusic(ini_section) {
	/* 
	scr_loadmusic(), by BPzeBanshee
	*/
	if !instance_exists(obj_ctrl_music) then exit;

	// This part assumes the ini works
	ini_open(global.music_ini);
	music_info[0] = ini_read_string(ini_section,"Path","NONE"); // file location
	music_info[1] = ini_read_real(ini_section,"Volume",100); // reads volume
	music_info[2] = real(ini_read_string(ini_section,"LoopStart","0")); // reads start of loop
	music_info[3] = real(ini_read_string(ini_section,"LoopEnd","1")); // reads end of loop
	ini_close();

	// quit early if no file to load
	if music_info[0] == "NONE" return -1; 

	// everything that's required is sorted, load and configure
	var m,a,b;
	m = ASourceLoad(music_info[0]);
	if m < 0 // Error check
	    {
	    trace("Error loading "+string(music_info[0]));
	    return -2;
	    }
    
	// Set loop points
	a = ASourceGetLength(m) * music_info[2];
	b = ASourceGetLength(m) * music_info[3];
	if a > 0 || b < 1 then ASourceAddLoopPoint(m,a,b,-1);
	return m;
}