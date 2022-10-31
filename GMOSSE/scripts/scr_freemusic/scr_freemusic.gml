/// @description scr_freemusic(music_id)
/// @param music_id
function scr_freemusic(music_id) {
	/*
	scr_freemusic(), by BPzeBanshee
	*/
	if !instance_exists(obj_ctrl_music) then exit;
	if music_id != -1 then ASourceFree(music_id);
}