///@desc Set starting game values
if room_exists(global.nextroom)
	{
	global.score_stored = 0;
	global.extend_number = 1;
	global.lives_stored = 3;
	global.bombs_stored = global.init_bombs;
	global.continues = 0;
	}