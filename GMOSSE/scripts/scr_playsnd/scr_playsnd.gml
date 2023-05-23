/// @description scr_playsnd(sound,stopfirst,[looping])
/// @param sound
/// @param stopfirst
/// @param [looping]
function scr_playsnd(sound_id,stopfirst=false,loop=false) {
	if global.sfx_volume == 0 then exit;
	if stopfirst then scr_stopsnd(sound_id);
	audio_play_sound(sound_id,0,loop);
}