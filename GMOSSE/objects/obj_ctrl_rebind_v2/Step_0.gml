// hook check
if !global.jup
&& !global.jdown
&& !global.jleft
&& !global.jright
&& !global.button1
&& !global.button2
&& !global.button3
&& !global.button4
&& !keyboard_check(vk_anykey)
hook = false;

// startup
if input == -1
	{
	if menu == 1
		{
		input = 0;
		exit;
		}
	if menu == 2 // gamepad mode: find IDs
		{
		if !gamepad_is_supported()
			{
			msg = "Gamepad not supported!";
			alarm[0] = 60;
			menu = -1;
			exit;
			}
	
		var count = 0;
		new_id = [];
		new_str = [];
		for (var i=0;i<gamepad_get_device_count();i++)
			{
			if gamepad_is_connected(i) 
				{
				array_push(new_id,i);
				array_push(new_str,gamepad_get_description(i));
				count++;
				}
			}
		if count == 0
			{
			msg = "NO GAMEPAD DETECTED!";
			alarm[0] = 60;
			input = -2;
			selection_max = 0;
			}
		if count == 1
			{
			global.joy_id = new_id[count-1];
			selection_max = 4;
			menu = 3;
			}
		if count > 1
			{
			selection_max = array_length(new_id);
			// TODO: menu for selecting IDs
			}
		
		input = 0;
		exit;
		}
	}
	
// rebind sequence
if input > 0 && !hook
	{
	if menu == 1
		{
		if keyboard_check(vk_anykey)
			{
			hook = true;
			var keys = [global.keycode_up,global.keycode_down,global.keycode_left,global.keycode_right,
			global.keycode_button1,global.keycode_button2,global.keycode_button3,global.keycode_button4];
			var strs = ["UP","DOWN","LEFT","RIGHT","FIRE","BOMB","FOCUS","START"];
			for (var i=0;i<array_length(keys);i++)
				{
				if keyboard_key == keys[i] 
					{
					input = 0;
					msg = strs[i]+" already bound!";
					alarm[0] = 90;
					return 0;
					}
				}
			switch input
				{
				case 1: global.keycode_up = keyboard_key; break;
			    case 2: global.keycode_down = keyboard_key; break;
			    case 3: global.keycode_left = keyboard_key; break;
			    case 4: global.keycode_right = keyboard_key; break;
			    case 5: global.keycode_button1 = keyboard_key; break;
			    case 6: global.keycode_button2 = keyboard_key; break;
			    case 7: global.keycode_button3 = keyboard_key; break;
			    case 8: global.keycode_button4 = keyboard_key; break;
				}
			input = 0;
			msg = "";
			}
		else return 0;
		}
	if menu == 3
		{
		with obj_ctrl_input enabled = false;
		var new_button = -1;
		for (var i=0;i<gamepad_button_count(global.joy_id);i++)
			{
			if gamepad_button_check(global.joy_id,i) new_button = i;
			}
		if new_button > -1 
			{
			switch input
				{
				case 1: global.joy1 = new_button; break;
				case 2: global.joy2 = new_button; break;
				case 3: global.joy3 = new_button; break;
				case 4: global.joy4 = new_button; break;
				}
			input = 0;
			msg = "";
			with obj_ctrl_input enabled = true;
			}
		else return 0;
		}
	}

// menu inputs
if input == 0
	{
	if global.jup && !hook
		{
		selection--;
		if selection < 0 selection = selection_max;
		hook = true;
		scr_snd_play(snd_click);
		}
	if global.jdown && !hook
		{
		selection++;
		if selection > selection_max selection = 0;
		hook = true;
		scr_snd_play(snd_click);
		}
	
	if global.button1 && !hook
		{
		scr_snd_play(snd_click);
		input = selection+1;
		if menu == 1 switch input
			{
			case 1: msg = "Press a key for UP";    break;
			case 2: msg = "Press a key for DOWN";  break;
			case 3: msg = "Press a key for LEFT";  break;
			case 4: msg = "Press a key for RIGHT"; break;
			case 5: msg = "Press a key for SHOT";  break;
			case 6: msg = "Press a key for BOMB";  break;
			case 7: msg = "Press a key for FOCUS"; break;
			case 8: msg = "Press a key for PAUSE"; break;
			case 9: instance_destroy(); break;
			}
		if menu == 2
			{
			global.joy_id = new_id[selection];
			input = 0;
			selection = 0;
			menu = 3;
			}
		if menu == 3 switch input
			{
			case 1: msg = "Press a key for SHOT";  break;
			case 2: msg = "Press a key for BOMB";  break;
			case 3: msg = "Press a key for FOCUS"; break;
			case 4: msg = "Press a key for PAUSE"; break;
			case 5: instance_destroy(); break;
			}
		hook = true;
		}
	}