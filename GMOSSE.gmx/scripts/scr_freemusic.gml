///scr_freemusic(id)
/*
scr_freemusic(), by BPzeBanshee
*/
if !instance_exists(obj_ctrl_music) then exit;
if argument0 != -1 then ASourceFree(argument0);
