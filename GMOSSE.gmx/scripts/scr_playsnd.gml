///scr_playsnd(sound,stopfirst,[looping])
if global.sfx_volume == 0 then exit;
if argument[1] == 1 then scr_stopsnd(argument[0]);

var loop;
if argument_count == 3 then loop = argument[2] else loop = false;
audio_play_sound(argument[0],0,loop);
