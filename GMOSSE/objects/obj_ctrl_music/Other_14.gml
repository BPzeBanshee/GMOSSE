/// @description  STAGE CLEAR MUSIC
timer = 0;
alpha = 0;

scr_stopmusic(music);
info = scr_loadmusicinfo("StageComplete");
music = scr_playmusic(snd_stageclear,false);
scr_setvolmusic(music);