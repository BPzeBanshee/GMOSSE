/// @description scr_snd_play(sound_id,[stopfirst],[looping])
/// @param sound_id
/// @param [stopfirst]
/// @param [looping]
function scr_snd_play(sound_id,stopfirst=false,loop=false) {
	// determine sound type, then get volume level to play at
	// TODO: better than kludging integer IDs but I still feel like this method sucks
	var voice_array = [snd_voice1,snd_voice2,snd_voice3,snd_voice4,snd_pain];
	var vol = 1;
	if array_contains(voice_array,sound_id)
		{
		if global.voice_volume == 0 then return 0;
		vol = audio_sound_get_gain(sound_id) * (round(global.voice_volume)/100);
		}
	else 
		{
		// stop script if muted
		if global.sfx_volume == 0 then return 0;
		vol = audio_sound_get_gain(sound_id) * (round(global.sfx_volume)/100);
		}
	
	// stop sound if already playing
	if stopfirst then scr_snd_stop(sound_id);
	
	// finally, play the damn thing
	audio_play_sound(sound_id,0,loop,vol);
	return 0;
}