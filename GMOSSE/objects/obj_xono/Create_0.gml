// Inherit vars from parent Create, if any
event_inherited();

// BOMB VARS
bombs = 3;
max_bombs = 5;

// WEAPON/TIMER VARS
shot_angle = 0;
shot_angle_add = 0;
shot_anim = 0;

lsr_timer = 0;
bomb_timer = 0;

// SPEED VARS
shipspeed = 5; 
slowshipspeed = 3;

// AESTHETIC VARS
has_afterimage = true;
afterimage_spr = spr_xono_aft;
outline_spr = spr_xono_out;
if sprite_index = spr_xono_v3 image_speed = 0.33;