function scr_clearbullets() {
	with obj_bullettarget
		{
		var e = instance_create_depth(x,y,depth,obj_bulletcancel);
		e.speed = speed;
		e.direction = direction;
		instance_destroy();
		}
	}