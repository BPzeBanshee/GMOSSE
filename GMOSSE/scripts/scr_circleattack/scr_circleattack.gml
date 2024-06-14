/// @func scr_circleattack(density,origin_x,origin_y,radius,object,target,b_speed,imageaim)
/// @desc Creates a circle of bullets. Written by S20-TBL, modified by BPzeBanshee.
/// @param {Real} density			controls the density of the circle pattern, in degrees
/// @param {Real} origin_x x		coordinate of the bullet's origin
/// @param {Real} origin_y y		coordinate of the bullet's origin
/// @param {Real} radius			distance from object at which bullet will be created
/// @param {Asset.GMObject}	object	bullet object to be created
/// @param {Id.Instance} target		target object the bullet is supposed to aim at
/// @param {Real} b_speed			bullet speed
/// @param {Bool} imageaim			whether to set image_angle to direction or not
function scr_circleattack(density,origin_x,origin_y,radius,object,target,b_speed,imageaim) {
	// written by S20-TBL
	var _x, _y, _bullet;
	for (var i=0; i<360; i+=density)   // controls the density of the bullet ring; smaller numbers mean tighter patterns
	    {
	    _x = origin_x + lengthdir_x(radius, i);   // distance from the origin at which the bullet will spawn
	    _y = origin_y + lengthdir_y(radius, i);
	    _bullet = instance_create_layer(_x, _y, global.lay_bullets, object);
		if instance_exists(target)
	    _bullet.direction = point_direction(x,y,target.x,target.y)+i
		else _bullet.direction = 270 + i;
	    _bullet.speed = b_speed;   // a negative value will make the bullet go towards the origin of the object firing it
	    if imageaim == true _bullet.image_angle = _bullet.direction;
	    }
}