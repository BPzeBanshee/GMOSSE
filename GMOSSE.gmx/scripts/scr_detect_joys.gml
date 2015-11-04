/*
scr_detect_joys(), by BPzeBanshee

Checks for a joystick using the old joystick_*
system first, if that fails then it "falls down"
to the new GM gamepad_* system. I made it this
way for compatibility purposes, fairly sure
the new system uses XInput so if you have a stick
that doesn't use it then the new system would
never pick it up. Not 100% on this though.
*/

global.joy_id = -1;
global.joy_system = 1;
if joystick_exists(1) then global.joy_id = 1
else if joystick_exists(2) then global.joy_id = 2
else for (i=0;i<gamepad_get_device_count();i+=1)
    {
    if gamepad_is_connected(i)
        {
        global.joy_id = i;
        global.joy_system = 2;
        }
    }

