/// @description scr_playmusic(id,loop)
/// @param id
/// @param loop
function scr_playmusic(argument0, argument1) {
	/* 
	scr_playmusic(), by BPzeBanshee

	Usage: scr_playmusic(argument0,argument1)
	argument0 = the file to play
	argument1 = looping (0 does not loop)
	*/
	if !instance_exists(obj_ctrl_music) then exit;
	if argument0 == -1 then exit;
	var e = AStreamPlay(argument0,1);
	AStreamSetRepeat(e,argument1);
	return e;
}
