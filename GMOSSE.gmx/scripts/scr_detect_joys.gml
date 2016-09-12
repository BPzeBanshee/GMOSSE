/*
scr_detect_joys(), by BPzeBanshee

Revision 12-9-16

Checks for a joystick using the new gamepad_*
system first, then if that fails it falls back
to the older joystick_* checks. global.joy_system
is used in scr_input() to determine which joystick
functions to check for pad input and is tested here.

This finding system is designed to pick the first ID
with a successful return. For finding a preferred pad
out of multiple returns this script returns a count of
successful devices for use in obj_ctrl_rebind userdef 2.
*/

global.joy_id = -1;
global.joy_system = 2;

var pad,count; 
pad = 0; 
count = 0;

// Try to find the first gamepad here
while pad < gamepad_get_device_count()
    {
    if gamepad_is_connected(pad) 
        {
        if global.joy_id = -1 then global.joy_id = pad;
        count += 1;
        }
    pad += 1;
    }
    
// If it failed to pick up anything we'll try the old functions
if pad = gamepad_get_device_count() && global.joy_id = -1
    {
    pad = 0;
    global.joy_system = 1;
    if joystick_exists(1)
        {
        if global.joy_id = -1 then global.joy_id = 1; 
        count += 1;
        }
    else if joystick_exists(2)
        {
        if global.joy_id = -1 then global.joy_id = 2; 
        count += 1;
        }
    }
show_debug_message("scr_detect_joys(): "+string(count)+" pads found, picking id "+string(global.joy_id));
return count;
