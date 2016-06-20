/* Assigns volume variables to the sounds/voices/music */
var vol;
vol = round(global.music_volume)/100;
AStreamSetVolume(music,vol);
