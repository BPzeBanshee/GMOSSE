// Compulsory
enemyHP = 1200;          // initial health
event_inherited();
//can_collide = false;
can_damage = false; // damage taken from pod children
// Initial moving/aesthetic variables
vspeed = 3.6;//3.75
spd = 0;
neg = 0;

// Pod-related
made = false;
pods_killed = 0;

// Attack-related
phase = 0;
timer = 0;
timeout = 6000;

for (var i=0;i<4;i++) pod[i] = noone;