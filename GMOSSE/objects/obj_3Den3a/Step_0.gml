image_angle += rotate_speed; 
if instance_exists(obj_player) && timer < 150
    {
    
    if rotate_speed < 10 then rotate_speed += 0.5;
    image_angle += rotate_speed;
    if timer < 2 then direction = point_direction(x,y,obj_hitbox.x,obj_hitbox.y);
    speed += 0.04;
    timer += 1;
    }
else
    {
    direction = 270;
    if rotate_speed < 10 then rotate_speed += 0.5;
    image_angle += rotate_speed;
    speed += 0.04;
    if y > yview+335 then instance_destroy();
    if x > 255 or x < -15 then instance_destroy();
    }

