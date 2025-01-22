/** @desc 
Bullet script for player ships. Passes variables under the hood so that
the bullets always spawn on the right layer, and enemies it hits
know which player game object to award score to.
*/
/// @param {Real} origin_x
/// @param {Real} origin_y
/// @param {Asset.GMObject} object
/// @param {Real} _speed
/// @param {Real} _direction
/// @returns created bullet object ID
function scr_player_shot(origin_x,origin_y,object,_speed,_direction,imgangle=true) {
	var bullet = instance_create_layer(origin_x,origin_y,global.lay_player_weapons,object);
	bullet.speed = _speed;
	bullet.direction = _direction;
	if imgangle bullet.image_angle = _direction;
	bullet.parent_id = id;
	bullet.myctrl = myctrl;
	return bullet;
}