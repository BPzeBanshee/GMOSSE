image_angle += rotate_speed; 
if instance_exists(obj_hitbox) && timer < 150
    {
    if rotate_speed < 10 rotate_speed += 0.5;
    image_angle += rotate_speed;
	var target = instance_nearest(x,y,obj_hitbox);
    if timer < 2 direction = point_direction(x,y,target.x,target.y);
    speed += 0.04;
    timer += 1;
    }
else
    {
    direction = 270;
    if rotate_speed < 10 rotate_speed += 0.5;
    image_angle += rotate_speed;
    speed += 0.04;
    }