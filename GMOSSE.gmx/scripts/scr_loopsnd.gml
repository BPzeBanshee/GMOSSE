///scr_loopsnd(sound,stopfirst)
if global.sfx_volume = 0 then exit;
if argument1=1 then scr_stopsnd(argument0);
audio_play_sound(argument0,0,1);
