/// @description  OMAKE BOSS THEME 3
timer = 0;
alpha = 0;

scr_stopmusic(music);
info = scr_loadmusicinfo("Omake3");
music = scr_playmusic(snd_omake3,true);
scr_setvolmusic(music);