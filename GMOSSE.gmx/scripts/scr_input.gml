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
global.jup = false;
global.jdown = false;
global.jleft = false;
global.jright = false;
global.button1 = false;
global.button2 = false;
global.button3 = false;
global.button4 = false;

// joystick movement handling
if global.joy_id >= 0
    {
    if global.joy_system = 1
        {
        /*
        Most common pads and joysticks have an analog stick, which will have
        two axes (x/y). Have the check in there anyway for arcade sticks
        that use POV Hat and not x/y axis.
        */
        if (joystick_axes(global.joy_id) >= 2 && global.joytype != 1)
            {
            if (joystick_ypos(global.joy_id) < -global.deadzone) global.jup = true;
            if (joystick_ypos(global.joy_id) > global.deadzone) global.jdown = true;
            if (joystick_xpos(global.joy_id) < -global.deadzone) global.jleft = true;
            if (joystick_xpos(global.joy_id) > global.deadzone) global.jright = true;
            }
            
        /*
        Gamepad "point-of-view/POV" handling (ie. Xbox 360 D-Pad and Arcade sticks).
        These variables are angles of the POV hat.
        Ive configured the angles so that there is something like 
        20/30 degrees of diagonal movement which in my tests 
        suited my Xbox 360 Controller's D-Pad nicely.
        For reference XBCD X360 controller has the triggers as
        joystick_zpos(id), - values for right and + values for left
        from 0 to 1.
        */
        if (joystick_has_pov(global.joy_id) && global.joytype > 0) 
            {
            if (joystick_pov(global.joy_id) > 300 || joystick_pov(global.joy_id) < 60) 
            && !(joystick_pov(global.joy_id) = -1) global.jup = true;
            if (joystick_pov(global.joy_id) > 120 && joystick_pov(global.joy_id) < 240) global.jdown = true;
            if (joystick_pov(global.joy_id) > 210 && joystick_pov(global.joy_id) < 330) global.jleft = true;
            if (joystick_pov(global.joy_id) > 30 && joystick_pov(global.joy_id) < 150) global.jright = true;
            }
        // joystick buttons
        if (joystick_check_button(global.joy_id,global.joy1)) global.button1 = true;
        if (joystick_check_button(global.joy_id,global.joy2)) global.button2 = true;
        if (joystick_check_button(global.joy_id,global.joy3)) global.button3 = true;
        if (joystick_check_button(global.joy_id,global.joy4)) global.button4 = true;
        }
    else // GAMEPAD_* FUNCTIONS
        {
        if (gamepad_axis_count(global.joy_id) >= 2 && global.joytype != 1)
            {
            // gamepad deadzone functions make this behaviour a bit odd, go old-school for now
            //if (gamepad_axis_value(global.joy_id,gp_axislv) < 0) global.jup = true;
            //if (gamepad_axis_value(global.joy_id,gp_axislv) > 0) global.jdown = true;
            //if (gamepad_axis_value(global.joy_id,gp_axislh) < 0) global.jleft = true;
            //if (gamepad_axis_value(global.joy_id,gp_axislh) > 0) global.jright = true;
            if (gamepad_axis_value(global.joy_id,gp_axislv) < -global.deadzone) global.jup = true;
            if (gamepad_axis_value(global.joy_id,gp_axislv) > global.deadzone) global.jdown = true;
            if (gamepad_axis_value(global.joy_id,gp_axislh) < -global.deadzone) global.jleft = true;
            if (gamepad_axis_value(global.joy_id,gp_axislh) > global.deadzone) global.jright = true;
            }
            
        // Joystick "direction" buttons
        if global.joytype > 0
            { 
            if (gamepad_button_check(global.joy_id,gp_padu)) global.jup = true;
            if (gamepad_button_check(global.joy_id,gp_padd)) global.jdown = true;
            if (gamepad_button_check(global.joy_id,gp_padl)) global.jleft = true;
            if (gamepad_button_check(global.joy_id,gp_padr)) global.jright = true;
            }
        
        // joystick buttons
        if (gamepad_button_check(global.joy_id,global.joy1)) global.button1 = true;
        if (gamepad_button_check(global.joy_id,global.joy2)) global.button2 = true;
        if (gamepad_button_check(global.joy_id,global.joy3)) global.button3 = true;
        if (gamepad_button_check(global.joy_id,global.joy4)) global.button4 = true;
        }
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

if os_browser != browser_not_a_browser
    {
    if device_mouse_check_button(0,mb_left) // touching screen
        {
        if instance_exists(obj_player)
            {
            global.button1 = true;
            
            if (device_mouse_x(0) > obj_player.x-16 && device_mouse_x(0) < obj_player.x+16)
            && (device_mouse_y(0) > obj_player.y-16 && device_mouse_y(0) < obj_player.y+16)
                {
                obj_player.x = clamp(device_mouse_x(0),xview+16,xview+240-16);
                obj_player.y = clamp(device_mouse_y(0),yview+16,yview+320-16);
                }
            
            if device_mouse_x(0) > xview+200 
            && device_mouse_y(0) < yview+40 
            then global.button4 = true;
            }
        else
            {
            if device_mouse_y(0) < yview+120 then global.jup = true;
            if device_mouse_y(0) > yview+200 then global.jdown = true;
            if device_mouse_x(0) < xview+90 then global.jleft = true;
            if device_mouse_x(0) > xview+150 then global.jright = true;
            }
        }
    if device_mouse_check_button_pressed(0,mb_left)
        {
        if instance_exists(obj_player)
            {
            if alarm[1] > 0 then global.button2 = true else alarm[1] = 15;
            }
        else
            {
            if alarm[0] > 0 then global.button1 = true else alarm[0] = 15;
            }
        }
    }
