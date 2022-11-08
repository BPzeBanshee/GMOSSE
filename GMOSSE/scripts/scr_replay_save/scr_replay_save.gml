/// @desc Saves a GMOSSE-standard replay to a given string address.
/// @param {ID.DsGrid} ds_grid
/// @param {String} filename
/// @return {Real}
function scr_replay_save(ds_grid, filename) {
	if !ds_exists(ds_grid,ds_type_grid) then return 1;

	var replay_str;
	replay_str = base64_encode(ds_grid_write(ds_grid));

	var f;
	f = file_text_open_write(filename);
	file_text_write_string(f,replay_str);
	file_text_close(f);
	return 0;
}