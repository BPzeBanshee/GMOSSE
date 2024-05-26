scr_3D();
image_angle += 10;
if speed < 6 then speed += 0.04;
if z > 128 then z -= z_speed;
if z <= 128
    {
    if instance_exists(obj_hitbox)
		{
		var target = instance_nearest(x,y,obj_hitbox);
		direction = point_direction(x,y,target.x,target.y);
		}
    else direction = 270;
    var en = scr_basicshot(x,y,layer,obj_3Den4,6,direction);
    en.image_angle = image_angle;
    instance_destroy();
    }