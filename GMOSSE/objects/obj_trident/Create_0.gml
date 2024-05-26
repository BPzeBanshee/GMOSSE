// Inherit vars from parent Create, if any
event_inherited();

// BOMB VARS
bombs = 2;
max_bombs = 4;
mybomb = noone;

// Weapon Variables
shot_timer = 0;
bomb_timer = 0;

// Movement Speed
reset_speed = function(){
shipspeed = 4; 
slowshipspeed = 2; // When Button 3 is pressed
}
reset_speed();
slow_speed = function(){
shipspeed = 1;
slowshipspeed = 1;
}

// Misc. Variables
has_banking = true;
img = 2;
img_bank_spd = 0.2;
image_speed = 0;
has_afterimage = true;
afterimage_spr = spr_trident_aft;
outline_spr = spr_trident_out;