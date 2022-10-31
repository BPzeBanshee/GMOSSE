scr_addscore(100,180,1);
instance_create_layer(x,y,layer,obj_explosion);
scr_playsnd(snd_exp1,1);
repeat 4 instance_create_layer(x,y,layer,obj_rock_dead);
instance_destroy();