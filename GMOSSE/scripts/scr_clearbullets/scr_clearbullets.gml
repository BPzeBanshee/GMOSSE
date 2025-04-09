function scr_clearbullets() {
	with obj_bullet_parent
		{
		var e = instance_create_depth(x,y,depth,obj_bulletcancel);
		e.speed = speed;
		e.direction = direction;
		instance_destroy();
		}
	}