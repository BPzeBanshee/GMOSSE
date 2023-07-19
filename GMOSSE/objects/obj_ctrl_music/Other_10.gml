///@desc Method Functions
play = function(music_id,loop=false){
if !audio_exists(music_id) then return -1;
var vol = round(global.music_volume)/100;
return audio_play_sound(music_id,0,loop,vol);
}

pause = function(){
if !audio_exists(channel) then return -1;
if audio_is_playing(channel) then audio_pause_sound(channel);
return 0;
}

resume = function(){
if !audio_exists(channel) then return -1;
if audio_is_paused(channel) then audio_resume_sound(channel);
return 0;
}

fade_in = function(rate=0.005){
if !audio_exists(channel) or fading_in then return -1;
fading_in = true;
// start with it off
audio_sound_gain(channel,0,0);

// calculate final volume
var vol = round(global.music_volume)/100;
var final_rate = ((vol/rate)/60)*1000; 
audio_sound_gain(channel,vol,final_rate);
return 0;
}

fade_out = function(rate=0.005){
if !audio_exists(channel) or fading_out then return -1;
fading_out = true;

// calculate final volume
var vol = round(global.music_volume)/100;
var final_rate = ((vol/rate)/60)*1000; 
audio_sound_gain(channel,0,final_rate);
return 0;
}

set_volume = function(){
if !audio_exists(channel) then return -1;
var vol = round(global.music_volume)/100;
audio_sound_gain(channel,vol,0);
return 0;
}

stop = function(){
if !audio_exists(channel) then return -1;
if audio_is_playing(channel) then audio_stop_sound(channel);
return 0;
}

stop_all = function(){
audio_stop_sound(channel);
audio_stop_sound(channel2);
return 0;
}

free = function(){
if !audio_exists(channel) then return -1;
audio_destroy_stream(channel);
return 0;
}