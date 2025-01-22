///@desc Set starting game values
if room_exists(global.nextroom)
	{
	global.player_data.myscore = 0;
	global.medalvalue = 1;
	global.player_data.mylives = 3;
	global.player_data.extends = 0;
	global.player_data.continues = 0;
	}
if global.jright 
global.player_data.hud_side = 1
else global.player_data.hud_side = 0;