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

// Display info
show_info = function(b=true){
showing_info = b;
alpha = 0;
timer = 0;
}
show_info(false);

// There's no list function so we just calculate how many sounds we have manually
// TODO: this is a hack that'll cause errors next beta, replace with bus structs or audiogroups
num_sfx = 0;
while audio_exists(num_sfx) num_sfx += 1;
scr_setvolsnd();

event_user(0);

loadMusic = function(){
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
	
unloadMusic = function(){
	free(snd_intro[0]);
	free(snd_shipselect[0]);
	free(snd_st1[0]);
	free(snd_st2[0]);
	free(snd_st3[0]);
	free(snd_st3b[0]);
	free(snd_boss[0]);
	free(snd_omake1[0]);
	free(snd_omake2[0]);
	free(snd_omake3[0]);
	free(snd_stageclear[0]);
	free(snd_continue[0]);
	free(snd_gameover[0]);
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
	
reloadMusic = function(){
	unloadMusic();
	loadMusic();
	}
	
loadMusic();