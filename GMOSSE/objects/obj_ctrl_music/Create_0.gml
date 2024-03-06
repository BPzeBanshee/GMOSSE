/*
obj_ctrl_music_v2, by BPzeBanshee

EXPERIMENTAL CONTROLLER THAT LOADS ALL MUSIC HANDLES AT ONCE.
USE AT YOUR OWN RISK.
*/

// Currently playing streams
channel = -1;
channel2 = -1;

// Array containers of music info
music = -1;
music2 = -1;

// Fade states
fading_in = false;
fading_out = false;

// 'Load all sounds' or 'load only needed'
LOAD_EVERYTHING = true;
CONTINUE_TOGGLE = false;

// Create methods
#region io
// Display info
show_info = function(b=true){
showing_info = b;
alpha = 0;
timer = 0;
}

// Load only the needed music
load = function(){
	var music_str = "";
	switch global.nextroom
		{
		case rm_menu: if room == rm_init then music_str = "Intro"; break;
		case rm_shipselect: music_str = "Selection"; break;
		case rm_stage1:
		case rm_boss1: music_str = "Stage1"; break;
		case rm_stage2:
		case rm_boss2: music_str = "Stage2"; break;
		case rm_stage3: music_str = "Stage3"; break;
		case rm_omake1: music_str = "Omake1"; break;
		case rm_omake2: music_str = "Omake2"; break;
		case rm_omake3: music_str = "Omake3"; break;
		default: break;
		}
	if music_str != "" then music = scr_music_load(music_str);
}

// Load ALL music at once
load_all = function(){
	snd_intro = scr_music_load("Intro");
    snd_shipselect = scr_music_load("Selection");
    snd_st1 = scr_music_load("Stage1");
    snd_st2 = scr_music_load("Stage2");
    snd_st3 = scr_music_load("Stage3");
    snd_st3b = scr_music_load("Stage3_B");
    snd_boss = scr_music_load("Boss1");
    snd_omake1 = scr_music_load("Omake1");
    snd_omake2 = scr_music_load("Omake2");
    snd_omake3 = scr_music_load("Omake3");
    snd_stageclear = scr_music_load("StageComplete");
    snd_continue = scr_music_load("Continue");
    snd_gameover = scr_music_load("GameOver");
	}
	
unload = function(){
	// currently playing containers
	if is_array(music) then free(music[0]);
	if is_array(music2) then free(music2[0]);
	music = -1;
	music2 = -1;
	
	// existing sound arrays and their audio handles at [0]
	if is_array(snd_intro) then free(snd_intro[0]);
	if is_array(snd_shipselect) then free(snd_shipselect[0]);
	if is_array(snd_st1) then free(snd_st1[0]);
	if is_array(snd_st2) then free(snd_st2[0]);
	if is_array(snd_st3) then free(snd_st3[0]);
	if is_array(snd_st3b) then free(snd_st3b[0]);
	if is_array(snd_boss) then free(snd_boss[0]);
	if is_array(snd_omake1) then free(snd_omake1[0]);
	if is_array(snd_omake2) then free(snd_omake2[0]);
	if is_array(snd_omake3) then free(snd_omake3[0]);
	if is_array(snd_stageclear) then free(snd_stageclear[0]);
	if is_array(snd_continue) then free(snd_continue[0]);
	if is_array(snd_gameover) then free(snd_gameover[0]);
	snd_intro = -1;
	snd_shipselect = -1;
	snd_st1 = -1;
	snd_st2 = -1;
	snd_st3 = -1;
	snd_st3b = -1;
    snd_boss = -1;
    snd_omake1 = -1;
    snd_omake2 = -1;
    snd_omake3 = -1;
    snd_stageclear = -1;
    snd_continue = -1;
    snd_gameover = -1;
	}
	
reload = function(){
	unload();
	if LOAD_EVERYTHING
	then load_all()
	else load();
	}
#endregion
#region core
play = function(music_id,loop=false){
if !audio_exists(music_id) then return -1;
var vol = round(global.music_volume)/100;
fading_in = false;
fading_out = false;
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
fading_in = false;
fading_out = false;
return 0;
}

stop_all = function(){
audio_stop_sound(channel);
audio_stop_sound(channel2);
fading_in = false;
fading_out = false;
return 0;
}

free = function(music_id){
if !audio_exists(music_id) then return -1;
audio_destroy_stream(music_id);
return 0;
}
#endregion

show_info(false);
if LOAD_EVERYTHING
then load_all()
else load();