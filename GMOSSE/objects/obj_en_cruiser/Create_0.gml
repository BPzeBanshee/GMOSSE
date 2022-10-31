phase = 1;
exptimer = 0;
made = 0;
box = noone;
hscroll = 0;
blend = c_white;
l = global.lay_bkg;//layer_get_id("lay_bkg");

// default turret choices
p[0,2] = obj_en_tur1;
p[1,2] = obj_en_tur1;
p[2,2] = obj_en_spawner;
p[3,2] = obj_en_spawner;
p[4,2] = obj_en_tur1;
p[5,2] = obj_en_tur1;

// enemy value to set to enemy spawners
for (var i=0;i<=5;i+=1) spawner_en[i]=0;

spawner_en[2] = obj_en5b;
spawner_en[3] = obj_en5b;

