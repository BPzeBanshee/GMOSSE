/// @descn Globalvar initialisation for ingame
// TODO: CONSOLIDATE THESE INTO ONE PLACE - COPIED FROM OBJ_DEBUG AND OBJ_SHIPSELECT
// TODO: replace RNG with map data, replace map data with GMOSSE recording
for (var i=0;i<2;i++)
	{
	global.player_data[i].shipselect = irandom_range(1,5);
	global.player_data[i].myscore = 0;
	global.player_data[i].extends = 0;
	global.player_data[i].mylives = 3;
	global.player_data[i].mybombs = -1;
	global.player_data[i].continues = 0;

	// Also having to load all the ship-specific shit as globalvars isn't ideal either
	global.player_data[i].optiontype = irandom_range(1,7);
	global.player_data[i].weapontype = irandom_range(1,7);
	}