scr_snd_play(snd_exp2);
scr_addscore(800,180,1);

var e = instance_create_depth(x,y,depth,obj_en7_dead);
e.direction = direction;
e.speed = speed;

instance_destroy();