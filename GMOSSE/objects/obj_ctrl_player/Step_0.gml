///@desc Do stuff

// DEBUG ONLY
if keyboard_check_pressed(vk_space)
	{
	done = false;
	num_of_players = 0;
	for (var i=0;i<2;i++)
		{
		using_gp[i] = false;
		joy_id[i] = -1;
		}
	exit;
	}

if !done
	{
	// Gamepad check
	if gp_supported
		{
		// 1P only check
		if joy_id[0] > -1
			{
			for (var i=0; i<gamepad_button_count(joy_id[0]); i++)
				{
				if gamepad_button_check_pressed(joy_id[0],i) done = true;
				}
			}
		else gp_check();
		}
	
	// Keyboard check
	if keyboard_check_pressed(vk_anykey)
		{
		// 1P only check
		if num_of_players == 1 && !using_gp[0]
			{
			done = true;
			}
		else
			{
			using_gp[num_of_players] = false;
			num_of_players += 1;
			}
		}
		
	st = "PRESS A KEY FOR "+string(num_of_players+1)+"P";
	if num_of_players == 1 st += "\nOR PRESS AGAIN TO PROCEED";
	}
else
	{
	st = "NUMBER OF PLAYERS: "+string(num_of_players)+"\n";
	for (var i=0; i<num_of_players;i++)
		{
		st += "PLAYER "+string(i+1)+" USING " + (using_gp[i] ? "GAMEPAD" : "KEYBOARD")+"\n";
		}
	}
	


/*
if num_of_players == 0
	{
	// Gamepad check
	gp_check();
	
	// Keyboard check
	if keyboard_check_pressed(vk_anykey)
		{
		using_gp[num_of_players] = false;
		num_of_players += 1;
		}
		
	st = "PRESS A KEY/BUTTON FOR 1P";
	}
else
	{
	// If 1P is using gamepad
	if joy_id[0] > -1
		{
		// 1P-Only Check (Gamepad)
		if gp_supported
			{
			for (var i=0; i<gamepad_button_count(joy_id[0]); i++)
				{
				if gamepad_button_check_pressed(joy_id[0],i) then done = true;
				}
			}
			
		// Keyboard check
		if keyboard_check_pressed(vk_anykey)
			{
			using_gp[num_of_players] = false;
			num_of_players += 1;
			done = true;
			}
		}
	else // If 1P is using keyboard
		{
		// 1P-Only Check (Keyboard)
		if keyboard_check_pressed(vk_anykey) then done = true;
		
		// Gamepad check for 2P
		gp_check();
		}
	
	st = "PRESS A KEY/BUTTON FOR 2P\nOR PRESS AGAIN TO PROCEED";
	}*/