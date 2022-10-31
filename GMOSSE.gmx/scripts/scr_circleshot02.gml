///scr_circleshot02(density,x,y,radius,object,speed,imageaim);
// written by S20-TBL
//this is for 360 attacks that aren't supposed to be aimed.

var density,origin_x,origin_y,obj_dist,b_type,b_speed,imageaim;
density = argument0;  // controls the density of the circle pattern, in degrees
origin_x = argument1; // x coordinate of the bullet's origin
origin_y = argument2; // y coordinate of the bullet's origin
obj_dist = argument3; // distance from object at which bullet will be created
b_type = argument4;   // bullet object to be created
b_speed = argument5;  // bullet speed
imageaim = argument6; // whether to set image_angle to direction or not

var _x, _y, bullet;
for (var i=0; i<360; i+=density)  // controls the density of the bullet ring; smaller numbers mean tighter patterns
    {
    _x = origin_x + lengthdir_x(obj_dist, i);   
    _y = origin_y + lengthdir_y(obj_dist, i);
    // ^^ distance from the origin at which the bullet will spawn
    
    // negative speed value will make bullet go towards origin of object firing it
    _bullet = instance_create(_x, _y, b_type);
    _bullet.speed = b_speed; 
    _bullet.direction = i;
    if imageaim = 1 then _bullet.image_angle = i;
    }
