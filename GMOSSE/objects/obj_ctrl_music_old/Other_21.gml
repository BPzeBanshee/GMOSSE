/// @description  OMAKE BOSS THEME 1
timer = 0;
alpha = 0;
scr_stopmusic(music);

info = scr_loadmusicinfo("Omake1");
music = scr_playmusic(snd_omake1,1);
scr_setvolmusic(music);