// Contra Yagawa Corps Eksploshunz by Michael Bay!
scr_create_exp(obj_explosion,360,18);
scr_snd_play(snd_exp2);

var dead;
dead = instance_create_layer(x,y,layer,obj_en6_dead);
dead.mode = 1;

repeat 2
	{
	dead = instance_create_layer(x,y,layer,obj_en6_dead);
	dead.mode = 2;
	dead = instance_create_layer(x,y,layer,obj_en6_dead);
	dead.mode = 3;
	}

scr_addscore(600,180,1);
instance_destroy();