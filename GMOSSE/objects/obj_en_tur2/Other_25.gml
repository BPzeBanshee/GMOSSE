scr_snd_play(snd_exp2);
var e;
repeat 3 
	{
	e = instance_create_depth(x,y,depth,obj_explosion);
	e.direction = random(360);
	e.speed = random(3);
	}
scr_addscore(200,180,1);
instance_destroy();