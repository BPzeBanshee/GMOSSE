/*
enemy cruiser, by BPze

ID and hitbox positions:
/----\
|hbox|
|0  1|
|2  3|
|4  5|
\----/
*/

phase = 1;
exptimer = 0;
made = 0;
box = noone;
hscroll = false;
blend = c_white;
l = global.lay_bkg;

// default turret choices
p[0,2] = obj_en_tur1;
p[1,2] = obj_en_tur1;
p[2,2] = obj_en_spawner;
p[3,2] = obj_en_spawner;
p[4,2] = obj_en_tur1;
p[5,2] = obj_en_tur1;

// enemy value to set to enemy spawners
for (var i=0; i<6; i++) spawner_en[i] = noone;
spawner_en[2] = obj_en5b;
spawner_en[3] = obj_en5b;