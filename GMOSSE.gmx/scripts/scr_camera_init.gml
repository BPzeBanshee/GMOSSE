///scr_camera_init(maxwidth,xspd,xdelay,yspd,ydelay)
/*
scr_camera_init, by BPzeBanshee

Defines global variables to set the maximum width
used for wobble scrolling, as well as the 
camera move speed and how much steps to delay each move by.

This allows for fraction/decimal based speed values
in an otherwise integer-only environment, or for
emulating Gradius MSX's poor scrolling code.
*/
if instance_exists(obj_ctrl_camera) then return -1;
globalvar max_w,spd_x,spd_y,delay_x,delay_y;
max_w = argument0; // range of player x movement
spd_x = argument1; // initial x speed
delay_x = argument2;
spd_y = argument3; // initial y speed
delay_y = argument4;
instance_create(x,y,obj_ctrl_camera);
