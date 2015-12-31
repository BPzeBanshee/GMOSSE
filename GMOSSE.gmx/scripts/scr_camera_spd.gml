///scr_camera_spd(xspeed,xdelay,yspeed,ydelay)
/*
scr_camera_spd, by BPzeBanshee

This is a function to set the camera speed and delay
values after having initialised the camera with
scr_camera_init.
*/
if !instance_exists(obj_ctrl_camera) return -1;

spd_x = argument0;
spd_y = argument2;

with obj_ctrl_camera
    {
    delay_x = argument1;
    alarm[0] = argument1;
    delay_y = argument3;
    alarm[1] = argument3;
    }
