if speed <= 0
    {
	var target = instance_nearest(x,y,obj_hitbox);
    direction = instance_exists(target) ? point_direction(x,y,target.x,target.y) : 270;
    speed = 1;
    friction = -0.2;
    }
if speed > 5 then speed = 5;

