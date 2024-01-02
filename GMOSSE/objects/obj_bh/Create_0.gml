/*
Variables that are used in the step function need to be called here
and assigned a variable first. 
*/
// WEAPON/TIMER VARS
shot_angle = 0;
shot_angle_add = 1;

can_shoot = true;
can_shoot2 = true;

// SPEED VARS
shipspeed = 1;
slowshipspeed = 1;
bombs = 0;
max_bombs = 0;

// OPTION VARS
switch global.optiontype
    {
    default: pod_type = obj_bh_type1; break;
    case 2: pod_type = obj_bh_type2; break;
    case 3: pod_type = obj_bh_type3; break;
    case 4: pod_type = obj_bh_type4; break;
    case 5: pod_type = obj_bh_type5; break;
    case 6: pod_type = obj_bh_type6; break;
    case 7: pod_type = obj_bh_type7; break;
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

image_timer = 0;
speed_gear = 1;
thrust_scale = 0.25;
speed_up = true;
can_speed = true;

option1 = instance_create_layer(x,y,layer,pod_type);
option1.parent = id;
option1.image_blend = blend;
option1.position = 1;
option1.direction = 90;
option2 = instance_create_layer(x,y,layer,pod_type);
option2.parent = id;
option2.image_blend = blend;
option2.position = 2;
option2.direction = 90;