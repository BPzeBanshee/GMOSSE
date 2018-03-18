///scr_pausemusic(true/false)
/*
scr_pausemusic, by BPzeBanshee
*/
if !instance_exists(obj_ctrl_music) then exit;
if argument0=1
then AStreamPause(music)
else AStreamResume(music);
