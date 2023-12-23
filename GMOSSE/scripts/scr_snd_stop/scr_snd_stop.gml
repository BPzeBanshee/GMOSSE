/// @desc scr_snd_stop(sound_id)
/// @param sound_id
/// @returns 0
function scr_snd_stop(sound_id) {
	audio_stop_sound(sound_id);
	return 0;
}