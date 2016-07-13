///scr_circleattack(density,x,y,radius,object,target,speed,imageaim);
// written by S20-TBL

var density,origin_x,origin_y,obj_dist,b_type,target,b_speed,imageaim;
density = argument0;  // controls the density of the circle pattern, in degrees
origin_x = argument1; // x coordinate of the bullet's origin
origin_y = argument2; // y coordinate of the bullet's origin
obj_dist = argument3; // distance from object at which bullet will be created
b_type = argument4;   // bullet object to be created
target = argument5;   // target object the bullet is supposed to aim at
b_speed = argument6;  // bullet speed
imageaim = argument7; // whether to set image_angle to direction or not

var _x, _y, bullet;
for (i=0; i<360; i+=density)   // controls the density of the bullet ring; smaller numbers mean tighter patterns
    {
    _x = origin_x + lengthdir_x(obj_dist, i);   // distance from the origin at which the bullet will spawn
    _y = origin_y + lengthdir_y(obj_dist, i);
    _bullet = instance_create(_x, _y, b_type);
    _bullet.direction = point_direction(x,y,target.x,target.y)+i;
    _bullet.speed = b_speed;   // a negative value will make the bullet go towards the origin of the object firing it
    if imageaim = 1 then _bullet.image_angle=_bullet.direction;
    }
