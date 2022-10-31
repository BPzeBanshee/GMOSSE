// Set aim at the nearest player hitbox
if instance_exists(obj_hitbox)
    {
    var target = instance_nearest(x,y,obj_hitbox);
    direction = point_direction(x,y,target.x,target.y);
    }