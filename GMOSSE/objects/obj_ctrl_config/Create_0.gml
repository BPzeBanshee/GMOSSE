enabled = false;
hook = true;

category = 0;
selection = 1;
selection_previous = 1;
selection_max = 1;
warning = "";
category_type = "";
reset_msg = "";
max_h = 0;
timer = 0;

// base position for menu
s = 125;

// Methods
pick_ini = function(){
	var load_name = get_open_filename("INI File (older builds)|*.ini|JSON File (new)|*.json","");
	if load_name != "" // only load if there was a file chosen
	    {
	    // Check extension
	    if filename_ext(load_name)==".ini" or filename_ext(load_name)==".json"
	    then global.music_ini = string_replace(load_name,string(working_directory)+"\\","") // if it has the extension then open it
	    else global.music_ini = string_replace(load_name,string(working_directory)+"\\","")+".ini";// otherwise add it on and open the file
		trace("global.music_ini set to "+global.music_ini);
		return 0;
		}
	return -1;
}