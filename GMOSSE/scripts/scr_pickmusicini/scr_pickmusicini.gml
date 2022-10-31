/// @description scr_pickmusicini()
function scr_pickmusicini() {
	/*
	scr_pickmusicini, by BPzeBanshee
	based off a few tutorials I picked from GMC forums.
	*/
	load_name = get_open_filename(".ini|*.ini*|","");
	if load_name != "" // only load if there was a file chosen
	    {
	    // Check extension
	    if filename_ext(load_name)=".ini"
	    then global.music_ini = string_replace(load_name,string(working_directory)+"\\","") // if it has the extension then open it
	    else global.music_ini = string_replace(load_name,string(working_directory)+"\\","")+".ini";// otherwise add it on and open the file
		return 0;
		}
	return -1;
}