/// @description  Fullscreen toggle hack for ini window
var ini = global.music_ini;
scr_music_pick_ini();
if file_exists(global.music_ini)
&& global.music_ini != ini
then obj_ctrl_music.reloadMusic();
with obj_ctrl_render alarm[1] = 1;