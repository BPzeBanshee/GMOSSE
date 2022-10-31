// Compulsory
enemyHP = 180;
event_inherited();

// Moving vars
direction = 270;
speed = 0.5;

// Attack vars
timer = 0;
phase = 1;
atk_timer = 0;
atk_phase = 1;
aim = 0;

tur_count = 0;
made = 0;

for (var i=0;i<4;i++) tur[i] = noone;