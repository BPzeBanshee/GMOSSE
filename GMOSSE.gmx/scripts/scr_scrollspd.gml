///scr_camera_spd(xspeed,xdelay,yspeed,ydelay)
spd_x = argument0;
spd_y = argument2;

with obj_ctrl_camera
    {
    delay_x = argument1;
    alarm[0] = argument1;
    delay_y = argument3;
    alarm[1] = argument3;
    }
