///scr_camera_spd(xspeed,yspeed)
/*
scr_camera_spd, by BPzeBanshee

This is a function to set the camera speed
values after having initialised the camera 
with scr_camera_init.
*/
if !instance_exists(obj_ctrl_camera) return -1;

spd_x = argument0;
spd_y = argument1;
