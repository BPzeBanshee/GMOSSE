// Compulsory
enemyHP = 1200;
event_inherited();

timeout = 5000;
scr_create_healthbar();

// Movement-related variables
image_speed = 0.1;
vspeed = 2;
move_timer = 0; 

// Attack related variables
phase = 0;
made = 0;
count = 0;
atk_timer = 0;
atk2_timer = 2;
orb1 = noone;
orb2 = noone;
orb1_radius = 0;
orb2_radius = 0;
orb1_angle = 0;
orb2_angle = 180;