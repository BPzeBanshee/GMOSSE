///@desc Fullscreen toggle hack for ini window
var ini = global.music_ini;
pick_ini();

if file_exists(global.music_ini)
&& global.music_ini != ini
then with obj_ctrl_music reload();

scr_fullscreen(global.fullscreen);