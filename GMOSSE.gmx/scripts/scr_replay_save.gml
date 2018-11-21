///scr_replay_save(ds_grid,filename)
if !ds_exists(argument0,ds_type_grid) then return 1;

var replay_str;
replay_str = base64_encode(ds_grid_write(argument0));

var f;
f = file_text_open_write(argument1);
file_text_write_string(f,replay_str);
/*file_text_writeln(f);
file_text_write_string(f,sha1_string_utf8(log_str)+chr(10)+log_str);
file_text_writeln(f);*/
file_text_close(f);
return 0;
