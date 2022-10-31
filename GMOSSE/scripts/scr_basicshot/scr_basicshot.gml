/// @desc Basic bullet script for GMOSSE. Original script written by Rozyrg, rewritten by BPzeBanshee.
/// @param {Real} origin_x
/// @param {Real} origin_y
/// @param {Id.Layer} _layer
/// @param {Asset.GMObject} object
/// @param {Real} _speed
/// @param {Real} _direction
/// @returns created bullet object ID
function scr_basicshot(origin_x,origin_y,_layer,object,_speed,_direction) {
	/*
	Caution:
	Do not rename or delete without checking for usage first.
	It's used quite extensively around GMOSSE to reduce
	excessive lines of code.
	*/
	var bullet = instance_create_layer(origin_x,origin_y,_layer,object);
	bullet.speed = _speed;
	bullet.direction = _direction;
	bullet.image_angle = _direction;
	return bullet;
}