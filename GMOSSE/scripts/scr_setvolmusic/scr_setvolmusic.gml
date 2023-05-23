/// @description scr_setvolmusic(stream)
/// @param stream
function scr_setvolmusic(music_id) {
	/* Assigns volume variables to the sounds/voices/music */
	var vol = round(global.music_volume)/100;
	audio_sound_gain(music_id,vol,0);
}