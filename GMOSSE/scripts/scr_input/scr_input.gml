function scr_input() {
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
	var joy_id = global.joy_id;
	global.jup = false;
	global.jdown = false;
	global.jleft = false;
	global.jright = false;
	global.button1 = false;
	global.button2 = false;
	global.button3 = false;
	global.button4 = false;

	// joystick movement handling
	if joy_id >= 0
	    {
	    if (gamepad_axis_count(joy_id) >= 2 && global.joytype != 1)
	        {
	        if (gamepad_axis_value(joy_id,gp_axislv) < -global.deadzone) global.jup = true;
	        if (gamepad_axis_value(joy_id,gp_axislv) > global.deadzone) global.jdown = true;
	        if (gamepad_axis_value(joy_id,gp_axislh) < -global.deadzone) global.jleft = true;
	        if (gamepad_axis_value(joy_id,gp_axislh) > global.deadzone) global.jright = true;
	        }
        
	    // Joystick "direction" buttons
	    if global.joytype > 0
	        { 
	        if (gamepad_button_check(joy_id,gp_padu)) global.jup = true;
	        if (gamepad_button_check(joy_id,gp_padd)) global.jdown = true;
	        if (gamepad_button_check(joy_id,gp_padl)) global.jleft = true;
	        if (gamepad_button_check(joy_id,gp_padr)) global.jright = true;
	        }
    
	    // joystick buttons
	    if (gamepad_button_check(joy_id,global.joy1)) global.button1 = true;
	    if (gamepad_button_check(joy_id,global.joy2)) global.button2 = true;
	    if (gamepad_button_check(joy_id,global.joy3)) global.button3 = true;
	    if (gamepad_button_check(joy_id,global.joy4)) global.button4 = true;
	    }

	/* 
	Keyboard control handling.
	This occurs regardless of whether a joystick is connected or not.
	This also does not take into account specific keyboard functions
	for hidden functions such as F4 for toggling fullscreen on-the-fly.
	*/
	if (keyboard_check(global.keycode_up)) global.jup = true;
	if (keyboard_check(global.keycode_down)) global.jdown = true;
	if (keyboard_check(global.keycode_left)) global.jleft = true;
	if (keyboard_check(global.keycode_right)) global.jright = true;
	if (keyboard_check(global.keycode_button1)) global.button1 = true;
	if (keyboard_check(global.keycode_button2)) global.button2 = true;
	if (keyboard_check(global.keycode_button3)) global.button3 = true;
	if (keyboard_check(global.keycode_button4)) global.button4 = true;

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
	            global.button1 = true;
				if point_in_rectangle(mx,my,obj_player.bbox_left,obj_player.bbox_top,
											obj_player.bbox_right,obj_player.bbox_bottom)
	                {
	                obj_player.x = clamp(mx,xview+16,xview+240-16);
	                obj_player.y = clamp(my,yview+16,yview+320-16);
	                }
            
	            if mx > xview+200 && my < yview+40 
	            global.button4 = true;
	            }
	        else
	            {
	            if my < yview+120 global.jup = true;
	            if my > yview+200 global.jdown = true;
	            if mx < xview+90 global.jleft = true;
	            if mx > xview+150 global.jright = true;
	            }
	        }
	    if device_mouse_check_button_pressed(0,mb_left)
	        {
	        if instance_exists(obj_player)
	            {
	            if alarm[1] > 0 {global.button2 = true} else alarm[1] = 15;
	            }
	        else
	            {
	            if alarm[0] > 0 {global.button1 = true} else alarm[0] = 15;
	            }
	        }
	    }
}