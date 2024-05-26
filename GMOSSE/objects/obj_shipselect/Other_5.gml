///@desc Set starting game values
if room_exists(global.nextroom)
	{
	global.medalvalue = 1;
	for (var i=0;i<2;i++)
		{
		global.player_data[i].myscore = 0;
		global.player_data[i].mylives = 3;
		global.player_data[i].mybombs = init_bombs;
		global.player_data[i].extends = 0;
		global.player_data[i].continues = 0;
		}
	}