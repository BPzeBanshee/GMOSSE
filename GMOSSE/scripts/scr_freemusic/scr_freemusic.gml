/// @description scr_freemusic(music_id)
/// @param music_id
function scr_freemusic(music_id) {
	/*
	scr_freemusic(), by BPzeBanshee
	*/
	if music_id != -1 then audio_destroy_stream(music_id);
}