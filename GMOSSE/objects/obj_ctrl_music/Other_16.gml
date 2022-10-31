/// @description  GAME OVER MUSIC
timer = 0;
alpha = 0;

scr_stopmusic(music);
info = scr_loadmusicinfo("GameOver");
music = scr_playmusic(snd_gameover,false);
scr_setvolmusic(music);
gameover = true;