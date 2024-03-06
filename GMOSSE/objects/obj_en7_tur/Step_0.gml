image_angle = direction;
if instance_exists(parentID)
    {
	var p = parentID;
    if p.phase == 0 then direction = p.direction;
    if p.phase == 1
        {
        var aim = 270;
        if instance_exists(obj_hitbox)
            {
            var tar = instance_nearest(x,y,obj_hitbox);
            aim = point_direction(x,y,tar.x,tar.y);
            }
        scr_turntoangle(aim,3);
        }
    if p.phase == 2 then direction += 16;
    if p.phase == 3 then scr_turntoangle(p.direction,3);
    }