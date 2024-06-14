///@desc Init vars and methods
gp_supported = gamepad_is_supported();
gp_count = gamepad_get_device_count();
alarm[0] = 60;
num_of_players = 0;
done = false;
st = "";

for (var i=0;i<2;i++)
	{
	joy_id[i] = -1; 
	using_gp[i] = false;
	}

gp_check = function(){
if gp_count > 0
	{
	for (var i = 0; i < gp_count; i++;)
		{
		if (gamepad_is_connected(i))
			{
			for (var j=0; j<gamepad_button_count(i);j++)
				{
				if gamepad_button_check_pressed(i,j)
					{
					using_gp[num_of_players] = true;
					joy_id[num_of_players] = i;
					num_of_players += 1;
					if num_of_players == 2 done = true;
					}
				}
			}
		}
	}
}