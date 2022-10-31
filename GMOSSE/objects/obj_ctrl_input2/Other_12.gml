/// @description  SAVE REPLAY
var l; 
l = get_save_filename("*.inp","replay.inp");
if l = "" then l = "replay.inp";

scr_replay_save(replay,l);

ds_grid_clear(replay,0);
ds_list_clear(input);
stagenum = 0;
log_str = "";

