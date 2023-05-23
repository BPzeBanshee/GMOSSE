/// @desc scr_playmusic(id,loop)
/// @param id
/// @param loop
function scr_playmusic(music_id, loop) {
	/* 
	scr_playmusic(), by BPzeBanshee
	*/
	if !instance_exists(obj_ctrl_music) then exit;
	if music_id == -1 then exit;
	
	return audio_play_sound(music_id,0,loop);
}