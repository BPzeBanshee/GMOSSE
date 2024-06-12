///@desc Bypassing ship selection screen
global.medalvalue = 1;
global.shipselect[0] = 1;
    
for (var i=0;i<2;i++)
	{
	global.player_data[i].myscore = 0;
	global.player_data[i].mylives = 3;
	global.player_data[i].mybombs = -1;
	global.player_data[i].extends = 0;
	global.player_data[i].continues = 0;
	}