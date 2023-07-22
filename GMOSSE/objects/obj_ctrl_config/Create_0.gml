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
	var load_name = get_open_filename(".ini|*.ini*|","");
	if load_name != "" // only load if there was a file chosen
	    {
	    // Check extension
	    if filename_ext(load_name)==".ini"
	    then global.music_ini = string_replace(load_name,string(working_directory)+"\\","") // if it has the extension then open it
	    else global.music_ini = string_replace(load_name,string(working_directory)+"\\","")+".ini";// otherwise add it on and open the file
		return 0;
		}
	return -1;
}