// Compulsory
enemyHP = 1200;          // initial health
event_inherited();
can_damage = false; // damage taken from pod children
// Initial moving/aesthetic variables
//image_alpha = 0;
vspeed = 3.6;//3.75
spd = 0;
neg = 0;

// Pod-related
made = 0;
pods_killed = 0;
hp1 = 300;
hp2 = 300;
hp3 = 300;
hp4 = 300;

// Attack-related
phase = 0;
timer = 0;
timeout = 6000;

for (var i=0;i<4;i++) pod[i] = noone;