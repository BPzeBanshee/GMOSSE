var thr = instance_create_layer(x,y,layer,obj_en_thr);
thr.speed = random_range(5,7);
thr.image_angle = random(360);
thr.direction = random_range(direction+160,direction+200);
thr.image_xscale = random(2.5);
thr.image_yscale = thr.image_xscale;
//thr.depth = depth + 1;

if instance_exists(obj_boss_trans)
    {
	step_towards_point(obj_boss_trans.x,obj_boss_trans.y,1.25);
    //mp_linear_step(obj_boss_trans.x,obj_boss_trans.y,1.25,0);
    if y == obj_boss_trans.y && x == obj_boss_trans.x then instance_destroy();
    }