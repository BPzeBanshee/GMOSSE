///@desc LOAD REPLAY
var l = get_open_filename("*.inp","replay.inp");
if l == "" then exit;
replay = scr_replay_load(replay,l);
show_message("Replay file version: "+string(replay[# 0,0])+"#Starting stage: "+string(replay[#0,1]));
var n = asset_get_index(replay[# 0,1]);
if room_exists(n) then global.startstage = n;