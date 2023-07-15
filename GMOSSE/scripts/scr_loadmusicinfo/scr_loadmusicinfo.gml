/// @description  scr_loadmusicinfo(ini_section)
/// @param {String} ini_section
/// @return 0, 1 if section not present, -1 if file not present
function scr_loadmusicinfo(ini_section) {
	if file_exists(global.music_ini) && music_info[0] != "NONE" // if the file exists
	    {
		// Open INI file
		// (Ubuntu has problems with comment lines in INIs)
		if os_type == os_linux
			{
			var inistring = file_to_string(global.music_ini);
			if inistring != "ERROR" then ini_open_from_string(inistring);
			}
	    else ini_open(global.music_ini); // open the file
	    if ini_section_exists(ini_section)
	        {
	        music_info[4] = ini_read_string(ini_section,"Title",""); // reads title
	        music_info[5] = ini_read_string(ini_section,"Game",""); // reads game of origin/album
	        music_info[6] = ini_read_string(ini_section,"Artist",""); // reads artist/composer
	        ini_close();
	        return 0;
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
	    return -1;
	    }
}