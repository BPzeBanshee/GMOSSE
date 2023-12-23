/// @desc scr_music_load_metadata(ini_section)
/// @param {String} ini_section
/// @returns {Array<any> | Real}
function scr_music_load_metadata(ini_section) {
	if file_exists(global.music_ini)
	    {
		// Open INI file
		// (Ubuntu has problems with comment lines in INIs)
		if os_type == os_linux
			{
			var inistring = file_to_string(global.music_ini);
			if inistring != "ERROR" then ini_open_from_string(inistring);
			}
	    else ini_open(global.music_ini);
		
		// Check section
	    if ini_section_exists(ini_section)
	        {
			var music_info;
			music_info[0] = ini_read_string(ini_section,"Path","NONE"); // file location
			music_info[1] = ini_read_real(ini_section,"Volume",100); // reads volume
			music_info[2] = real(ini_read_string(ini_section,"LoopStart","0")); // reads start of loop
			music_info[3] = real(ini_read_string(ini_section,"LoopEnd","1")); // reads end of loop
	        music_info[4] = ini_read_string(ini_section,"Title",""); // reads title
	        music_info[5] = ini_read_string(ini_section,"Game",""); // reads game of origin/album
	        music_info[6] = ini_read_string(ini_section,"Artist",""); // reads artist/composer
	        ini_close();
	        return music_info;
	        }
	    else
	        {
	        ini_close();
	        trace("Music Error: Couldn't find section");
	        return 1;
	        }
	    }
	else 
		{
		trace("Music Error: Couldn't find INI file "+string(global.music_ini));
		return 2;
		}
}