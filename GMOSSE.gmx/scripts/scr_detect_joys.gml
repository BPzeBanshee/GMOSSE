///scr_detect_joys()
/*
scr_detect_joys(), by BPzeBanshee

Revision 3-4-18

Checks for a joystick using the new gamepad_* system.

This finding system is designed to pick the first ID
with a successful return. For finding a preferred pad
out of multiple returns this script returns a count of
successful devices for use in obj_ctrl_rebind userdef 2.
*/

global.joy_id = -1;

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
then scr_console("scr_detect_joys(): Failed to find any joystick/gamepads")
else scr_console("scr_detect_joys(): "+string(count)+" pads found, picking id "+string(global.joy_id));
return count;
