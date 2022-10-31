/// @description  BOSS THEME
if instance_exists(obj_ctrl_gameover) then exit;

timer = 0;
alpha = 0;

scr_stopmusic(music);
info = scr_loadmusicinfo("Boss1");
music = scr_playmusic(snd_boss,true);
scr_setvolmusic(music);