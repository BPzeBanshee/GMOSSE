/// @description scr_replay_load(ds_grid,filename)
/// @param ds_grid
/// @param filename
function scr_replay_load(argument0, argument1) {
	var f,s;
	f = file_text_open_read(argument1);
	s = base64_decode(file_text_read_string(f));
	file_text_close(f);
	if s != "" && ds_exists(argument0,ds_type_grid)
	    {
	    ds_grid_read(argument0,s);
	    return argument0;
	    }
	else 
	    {
	    show_message("scr_replay_load: error loading replay"); 
	    return 1;
	    }



}
