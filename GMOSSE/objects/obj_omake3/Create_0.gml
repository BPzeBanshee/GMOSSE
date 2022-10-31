/* |<I|_|_J<>y |\/||< || */
// Compulsory (health, z-handling, etc)
enemyHP = 1000; 
event_inherited();
timeout = 9999;

// Enemy timing
phase = 0;
timer = 0;
atk_timer = 0;

// Arm handling
made = 0;
arm_left = noone;
arm_right = noone;
arms_dead = 0;
x1 = x; y1 = y;
x2 = x; y2 = y;
d1 = 0; d2 = 0;
b = 0; 

// Leg handling
legs = instance_create_layer(x,y,layer,obj_omake3_legs);
legs.image_angle = image_angle;

// Movement-related
image_angle = 270;
direction = 270;
speed = 5;
speed_max = -1;

// Set healthbar on and start music
with obj_ctrl_music event_user(13);
scr_create_healthbar();