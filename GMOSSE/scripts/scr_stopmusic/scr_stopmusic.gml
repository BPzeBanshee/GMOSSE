/// @desc Stops a given music track
/// @param music_id
function scr_stopmusic(music_id) {
	/*
	scr_stopmusic(), by BPzeBanshee
	*/
	if music_id > -1
	    {
	    if AStreamIsPlaying(music_id) then AStreamStop(music_id);
	    }
}