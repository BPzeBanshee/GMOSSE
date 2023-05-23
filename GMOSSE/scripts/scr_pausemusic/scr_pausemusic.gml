/// @description scr_pausemusic(true/false)
/// @param {Bool} _bool
function scr_pausemusic(_bool) {
	/*
	scr_pausemusic, by BPzeBanshee
	*/
	if instance_exists(obj_ctrl_music)
		{
		var m = obj_ctrl_music.music;
		if _bool then audio_pause_sound(m) else audio_resume_sound(m);
		}
}