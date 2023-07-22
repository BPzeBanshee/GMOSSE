scr_addscore(100,180,1);
instance_create_layer(x,y,layer,obj_explosion);
scr_snd_play(snd_exp1,true);
repeat 4 instance_create_layer(x,y,layer,obj_rock_dead);
instance_destroy();