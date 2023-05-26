/*
obj_ctrl_music_v2, by BPzeBanshee

EXPERIMENTAL CONTROLLER THAT LOADS ALL MUSIC HANDLES AT ONCE.
USE AT YOUR OWN RISK.

TODO: DE-DUPLICATE CODE BY INHERITING FROM OBJ_CTRL_MUSIC
*/
music = -1;
music2 = -1;
fade_in = false;
fade_out = false;
fade_amount = 0;
fade_value = -1;
fade_song = -1; //clutch to stop music switching getting faded out

timer = 360;
alpha = 0;
info = -1; // init variable for music loading scripts
mainmenu = 0;
gameover = 0;

// There's no list function so we just calculate how many sounds we have manually
num_sfx = 0;
while audio_exists(num_sfx) num_sfx += 1;
scr_setvolsnd();

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

setVolumeMusic = function(music,amount){
	audio_sound_gain(music,amount,0);
}

loadMusic = function(){
	snd_intro = scr_loadmusic("Intro");
    snd_shipselect = scr_loadmusic("Selection");
    snd_st1 = scr_loadmusic("Stage1");
    snd_st2 = scr_loadmusic("Stage2");
    snd_st3 = scr_loadmusic("Stage3");
    snd_st3b = scr_loadmusic("Stage3_B");
    snd_boss = scr_loadmusic("Boss1");
    snd_omake1 = scr_loadmusic("Omake1");
    snd_omake2 = scr_loadmusic("Omake2");
    snd_omake3 = scr_loadmusic("Omake3");
    snd_stageclear = scr_loadmusic("StageComplete");
    snd_continue = scr_loadmusic("Continue");
    snd_gameover = scr_loadmusic("GameOver");
	}
	
unloadMusic = function(){
	//scr_freeallmusic();
	scr_freemusic(snd_intro);
	scr_freemusic(snd_shipselect);
	scr_freemusic(snd_st1);
	scr_freemusic(snd_st2);
	scr_freemusic(snd_st3);
	scr_freemusic(snd_st3b);
	scr_freemusic(snd_boss);
	scr_freemusic(snd_omake1);
	scr_freemusic(snd_omake2);
	scr_freemusic(snd_omake3);
	scr_freemusic(snd_stageclear);
	scr_freemusic(snd_continue);
	scr_freemusic(snd_gameover);
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