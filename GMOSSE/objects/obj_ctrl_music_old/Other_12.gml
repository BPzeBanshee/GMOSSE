/// @description  BIG BOSS THEME (STAGE 3)
/// @param STAGE 3
if instance_exists(obj_ctrl_gameover) then exit;

timer = 0;
alpha = 0;

scr_stopmusic(music);
info = scr_loadmusicinfo("Stage3_B");
music = scr_playmusic(snd_st3b,1);
scr_setvolmusic(music);

