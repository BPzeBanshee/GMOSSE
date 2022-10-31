image_angle = direction;

if (parent).atk_phase == 1
	{
	var aim,target;
	target = instance_nearest(x,y,obj_hitbox);
	if target == noone
	then aim = 270
	else aim = point_direction(x,y,target.x,target.y);
	
	scr_turntoangle(aim,2.5);
	}