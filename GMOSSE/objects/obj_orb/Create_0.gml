// Compulsory (health etc)
enemyHP = 400;
event_inherited();

timer = 0;
phase = 0;

// TODO: do we need event_user(0)? declared vars here to shut up Feather
atk_timer = 1;
atk2_timer = 30;
atk3_timer = 1;
spd = 3;
count = 0;
count2 = 0;

event_user(0);

