///@desc Fullscreen toggle hack for ini window
var ini = global.music_ini;
pick_ini();

with obj_ctrl_music
	{
	if LOAD_EVERYTHING
		{
		if file_exists(global.music_ini)
		&& global.music_ini != ini
		then reload();
		}
	}
scr_fullscreen(global.fullscreen);