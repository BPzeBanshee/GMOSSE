/// @description scr_freeallmusic()
function scr_freeallmusic() {
	/* Frees the music from memory */
	if !instance_exists(obj_ctrl_music) then exit;
	ASourceFreeAll();
}