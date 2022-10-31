/// @description scr_setvolmusic(stream)
/// @param stream
function scr_setvolmusic(argument0) {
	/* Assigns volume variables to the sounds/voices/music */
	var vol;
	vol = round(global.music_volume)/100;
	AStreamSetVolume(argument0,vol);
}