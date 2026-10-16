///@desc DEBUG: toggle speed
if replaying
	{
	if game_get_speed(gamespeed_fps) == 60
	game_set_speed(9999,gamespeed_fps)
	else game_set_speed(60,gamespeed_fps);
	}