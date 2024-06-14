/// @desc scr_music_load_ini(ini_section)
/// @param {String} ini_section
/// @returns {Struct | Real}
function scr_music_load_ini(ini_section) {
	var f = filename_change_ext(global.music_ini,".ini");
	ini_open_fixed(f);
		
	// Check section
	if ini_section_exists(ini_section)
	    {
		var music_info = {
			Path:		ini_read_string(ini_section,"Path","NONE"),			// file location;
			Volume:		ini_read_real(ini_section,"Volume",100),			// reads volume
			LoopStart:	real(ini_read_string(ini_section,"LoopStart","0")), // reads start of loop
			LoopEnd:	real(ini_read_string(ini_section,"LoopEnd","1")),	// reads end of loop
			Title:		ini_read_string(ini_section,"Title",""),			// reads title
			Game:		ini_read_string(ini_section,"Game",""),			// reads game of origin/album
			Artist:		ini_read_string(ini_section,"Artist","")		// reads artist/composer
			}
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

/// @desc scr_music_load_json(section)
/// @param {String} section
/// @returns {Struct | Real}
function scr_music_load_json(section){
	var f = filename_change_ext(global.music_ini,".json");
	var myjson = json_parse(file_to_string(f));
	if variable_struct_exists(myjson,section)
		{
		var mystruct = myjson[$section];
		if !struct_exists(mystruct,"Volume") struct_set(mystruct,"Volume",100);
		if !struct_exists(mystruct,"LoopStart") struct_set(mystruct,"LoopStart",0);
		if !struct_exists(mystruct,"LoopEnd") struct_set(mystruct,"LoopEnd",1);
		
		// Feather disable once GM1063
		return is_struct(mystruct) ? mystruct : 3;
		}
	else
		{
		trace("Music Error: Couldn't find section");
	    return 1;
	    }
}