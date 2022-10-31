/// @description scr_stopallmusic()
function scr_stopallmusic() {
	/*
	scr_stopallmusic, by BPzeBanshee
	*/
	if !instance_exists(obj_ctrl_music) then exit;
	AStreamStopAll();
}