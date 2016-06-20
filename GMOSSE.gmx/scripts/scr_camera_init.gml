///scr_camera_init(left_bound,right_bound,xspd,yspd)
/*
scr_camera_init, by BPzeBanshee
updated to use input/bound code 11-4-16
*/
if instance_exists(obj_ctrl_camera) then return -1;
globalvar left_bound,right_bound,spd_x,spd_y;
// range of player x movement
left_bound = argument0;
right_bound = argument1; 
spd_x = argument2; // initial x speed
spd_y = argument3; // initial y speed
instance_create(x,y,obj_ctrl_camera);
