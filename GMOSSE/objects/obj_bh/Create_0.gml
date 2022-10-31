/*
Variables that are used in the step function need to be called here
and assigned a variable first. 
*/
/* WEAPON/TIMER VARS */
shot_angle = 0;
shot_angle_add = 1;

can_shoot = 1;
can_shoot2 = 1;
can_shoot_bomb = 1;

/* SPEED VARS */
/* 
Personally I keep diagonal move speeds the same as the 
shipspeed but this is customisable to tailor to your needs. 
Apparently limiting diagonal speed is a common thing 
in shmups but I've never really noticed or liked it.
*/
global.shipspeed = 1;
global.slowshipspeed = 1;

/* OPTION VARS */
switch global.optiontype
    {
    default: option_t1 = obj_bh_type1; option_t2 = obj_bh_type1; break;
    case 2: option_t1 = obj_bh_type2; option_t2 = obj_bh_type2; break;
    case 3: option_t1 = obj_bh_type3; option_t2 = obj_bh_type3; break;
    case 4: option_t1 = obj_bh_type4; option_t2 = obj_bh_type4; break;
    case 5: option_t1 = obj_bh_type5; option_t2 = obj_bh_type5; break;
    case 6: option_t1 = obj_bh_type6a; option_t2 = obj_bh_type6b; break;
    case 7: option_t1 = obj_bh_type7a; option_t2 = obj_bh_type7b; break;
    }
weapon = global.weapontype;
switch weapon
    {
    case 1: blend = 16744576; break; // light blue
    case 2: blend = 15724527; break; // light grey
    case 3: blend = 11140992; break; // green
    case 4: blend = 1776572; break; // maroon
    case 5: blend = 4227327; break;// orange
    case 6: blend = 16776960; break; // very light blue 
    case 7: blend = 16744703; break; // pink
    }

shootingtime = 0;
image_timer = 0;
speed_gear = 1;
thrust_scale = 0.25;
speed_up = 1;
can_speed = 1;

option1 = instance_create_layer(x,y,layer,option_t1);
option1.parent = id;
option1.image_blend = blend;
option1.position = 1;
option1.direction = 90;
option2 = instance_create_layer(x,y,layer,option_t2);
option2.parent = id;
option2.image_blend = blend;
option2.position = 2;
option2.direction = 90;

/* AESTHETIC VARS */
// TOOD: This could be a draw event, but...
mytrace = instance_create_layer(x,y,layer,obj_bh_trace);
mytrace.image_blend = blend;