/// @desc Loads a GMOSSE-standard replay into a ds_grid
/// @param {ID.DsGrid} ds_grid
/// @param {String} filename
/// @return {ID.DsGrid|Real}
function scr_replay_load(ds_grid, filename) {
	var f,s;
	f = file_text_open_read(filename);
	s = base64_decode(file_text_read_string(f));
	file_text_close(f);
	if s != "" && ds_exists(ds_grid,ds_type_grid)
	    {
	    ds_grid_read(ds_grid,s);
	    return ds_grid;
	    }
	else 
	    {
	    show_message("scr_replay_load: error loading replay"); 
	    return 1;
	    }
}