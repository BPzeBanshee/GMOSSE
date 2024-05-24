///@desc Bypassing ship selection screen
global.shipselect[global.myside] = 1;
    
for (var i=0;i<2;i++)
	{
	global.score_stored[i] = 0;
	global.lives_stored[i] = 3;
	global.bombs_stored[i] = -1;
	global.extend_number[i] = 1;
	global.continues[i] = 0;
	global.medalvalue[i] = 1;
	}

// TODO: globalvars for specific ship stats aren't ideal
global.optiontype[global.myside] = 6;
global.weapontype[global.myside] = 1;