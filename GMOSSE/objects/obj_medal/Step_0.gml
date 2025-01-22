var p = instance_nearest(x,y,obj_player);
if distance_to_object(p) < 32
	{
	direction = point_direction(x,y,p.x,p.y);
	speed = 4;
	}
else 
	{
	direction = 270;
	speed += 0.1;
	if speed > 2 speed = 2;
	}

if y > yview+320+sprite_yoffset
	{
	if instance_number(object_index) == 1 global.medalvalue = 1;
	instance_destroy();
	}