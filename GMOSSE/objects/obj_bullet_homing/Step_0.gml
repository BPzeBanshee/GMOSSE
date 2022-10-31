if speed <= 0
    {
    direction = point_direction(x,y,obj_hitbox.x, obj_hitbox.y);
    speed = 1;
    friction = -0.2;
    }
if speed > 5 then speed = 5;

