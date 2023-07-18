/*
Variables that are used in the step function need to be called here
and assigned a variable first. 
*/
/* WEAPON/TIMER VARS */
shot_angle = 0;
shot_angle_add = 0;
shot_anim = 0;

lsr_timer = 0;
bomb_timer = 0;

/* SPEED VARS */
global.shipspeed = 5; 
global.slowshipspeed = 3;

/* AESTHETIC VARS */
if global.xonospr == 2 then sprite_index = spr_xono_v2;
if global.xonospr == 3 
    {
    sprite_index = spr_xono_v3;
    image_speed = 0.33;
    }