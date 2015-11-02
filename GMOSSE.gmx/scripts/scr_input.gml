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
if joystick_exists(1)
    {
    global.joy_id = 1;
    }
else
    {
    global.joy_id = 2;
    }

// joystick movement handling
if (joystick_exists(global.joy_id))
    {
    /*
    Most common pads and joysticks have an analog stick, which will have
    two axes (x/y). Have the check in there anyway for arcade sticks
    that use POV Hat and not x/y axis.
    */
    if (joystick_axes(global.joy_id) >= 2)
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
    if (joystick_has_pov(global.joy_id) = true) 
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
