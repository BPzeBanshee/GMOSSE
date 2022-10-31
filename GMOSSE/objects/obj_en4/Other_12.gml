// Set aim at the nearest obj_3Den2 instead
if instance_exists(obj_3Den2)
    {
    var target = instance_nearest(x,y,obj_3Den2);
    direction = point_direction(x,y,target.x,target.y);
    }
else direction = 270;