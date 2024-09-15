function scr_input(playerid = 0) {
	/********Joysick/Gamepad/Keyboard Input Controller**********
	Created by Nimitz
	Fixed, improved and maintained by BPzeBanshee

	Usage: scr_input()

	No arguments. Must be called in Step event.
	***********************************************************/
	/* 
	Initialises global variables as zero. The idea is that when a key 
	sets these variables to 1 movement stuff happens and when the keys 
	are stopped this will bring the variables to 0 immediately.
	*/
	var joy_id = global.joy_id[playerid];
	global.jup[playerid] = false;
	global.jdown[playerid] = false;
	global.jleft[playerid] = false;
	global.jright[playerid] = false;
	global.button1[playerid] = false;
	global.button2[playerid] = false;
	global.button3[playerid] = false;
	global.button4[playerid] = false;

	// joystick movement handling
	if joy_id >= 0
	    {
	    if (gamepad_axis_count(joy_id) >= 2 && global.joytype != 1)
	        {
	        if (gamepad_axis_value(joy_id,gp_axislv) < -global.deadzone) global.jup[playerid] = true;
	        if (gamepad_axis_value(joy_id,gp_axislv) > global.deadzone) global.jdown[playerid] = true;
	        if (gamepad_axis_value(joy_id,gp_axislh) < -global.deadzone) global.jleft[playerid] = true;
	        if (gamepad_axis_value(joy_id,gp_axislh) > global.deadzone) global.jright[playerid] = true;
	        }
        
	    // Joystick "direction" buttons
	    if global.joytype > 0
	        { 
	        if (gamepad_button_check(joy_id,gp_padu)) global.jup[playerid] = true;
	        if (gamepad_button_check(joy_id,gp_padd)) global.jdown[playerid] = true;
	        if (gamepad_button_check(joy_id,gp_padl)) global.jleft[playerid] = true;
	        if (gamepad_button_check(joy_id,gp_padr)) global.jright[playerid] = true;
	        }
    
	    // joystick buttons
	    if (gamepad_button_check(joy_id,global.joy1)) global.button1[playerid] = true;
	    if (gamepad_button_check(joy_id,global.joy2)) global.button2[playerid] = true;
	    if (gamepad_button_check(joy_id,global.joy3)) global.button3[playerid] = true;
	    if (gamepad_button_check(joy_id,global.joy4)) global.button4[playerid] = true;
	    }

	/* 
	Keyboard control handling.
	This occurs regardless of whether a joystick is connected or not.
	This also does not take into account specific keyboard functions
	for hidden functions such as F4 for toggling fullscreen on-the-fly.
	*/
	if (keyboard_check(global.keycode_up)) global.jup[playerid] = true;
	if (keyboard_check(global.keycode_down)) global.jdown[playerid] = true;
	if (keyboard_check(global.keycode_left)) global.jleft[playerid] = true;
	if (keyboard_check(global.keycode_right)) global.jright[playerid] = true;
	if (keyboard_check(global.keycode_button1)) global.button1[playerid] = true;
	if (keyboard_check(global.keycode_button2)) global.button2[playerid] = true;
	if (keyboard_check(global.keycode_button3)) global.button3[playerid] = true;
	if (keyboard_check(global.keycode_button4)) global.button4[playerid] = true;

	/*
	Touch-based controls (Web Browser only)

	Currently does not account for uneven stretch option
	as far as "mouse" position so values don't reflect
	final touch location.
	*/
	if instance_exists(obj_ctrl_render_mob)
	    {
	    if device_mouse_check_button(0,mb_left) // touching screen
	        {
			var mx = device_mouse_x(0);
			var my = device_mouse_y(0);
	        if instance_exists(obj_player)
	            {
	            global.button1[playerid] = true;
				if point_in_rectangle(mx,my,obj_player.bbox_left,obj_player.bbox_top,
											obj_player.bbox_right,obj_player.bbox_bottom)
	                {
	                obj_player.x = clamp(mx,xview+16,xview+240-16);
	                obj_player.y = clamp(my,yview+16,yview+320-16);
	                }
            
	            if mx > xview+200 && my < yview+40 
	            global.button4[playerid] = true;
	            }
	        else
	            {
	            if my < yview+120 global.jup[playerid] = true;
	            if my > yview+200 global.jdown[playerid] = true;
	            if mx < xview+90 global.jleft[playerid] = true;
	            if mx > xview+150 global.jright[playerid] = true;
	            }
	        }
	    if device_mouse_check_button_pressed(0,mb_left)
	        {
	        if instance_exists(obj_player)
	            {
	            if alarm[1] > 0 {global.button2[playerid] = true} else alarm[1] = 15;
	            }
	        else
	            {
	            if alarm[0] > 0 {global.button1[playerid] = true} else alarm[0] = 15;
	            }
	        }
	    }
}