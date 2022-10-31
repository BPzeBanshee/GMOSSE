image_angle = direction;
if instance_exists((parent))
    {
    if (parent).phase == 0 then direction = (parent).direction;
    if (parent).phase == 1
        {
        var aim;
        if instance_exists(obj_hitbox)
            {
            var tar = instance_nearest(x,y,obj_hitbox);
            aim = point_direction(x,y,tar.x,tar.y);
            }
        else aim = 270;
        scr_turntoangle(aim,3);
        }
    if (parent).phase == 2 then direction += 16;
    if (parent).phase == 3 then scr_turntoangle((parent).direction,3);
    }

