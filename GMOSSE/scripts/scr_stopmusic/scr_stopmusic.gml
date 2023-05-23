/// @desc Stops a given music track
/// @param music_id
function scr_stopmusic(music_id) {
	/*
	scr_stopmusic(), by BPzeBanshee
	*/
	if music_id > -1
	    {
		if audio_is_playing(music_id) then audio_stop_sound(music_id);
		}
}