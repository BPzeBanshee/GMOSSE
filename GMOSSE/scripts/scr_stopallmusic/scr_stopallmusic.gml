/// @description scr_stopallmusic()
function scr_stopallmusic() {
	/*
	scr_stopallmusic, by BPzeBanshee
	*/
	with obj_ctrl_music 
		{
		audio_stop_sound(music);
		audio_stop_sound(music2);
		}
	//audio_stop_all();
}