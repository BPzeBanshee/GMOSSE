image_angle = direction;

if (parent_id).atk_phase == 1
	{
	var aim = 270;
	var target = instance_nearest(x,y,obj_hitbox);
	if target != noone aim = point_direction(x,y,target.x,target.y);
	
	scr_turntoangle(aim,2.5);
	}