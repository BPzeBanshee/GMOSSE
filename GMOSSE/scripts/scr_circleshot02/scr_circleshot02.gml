/**
 * Creates 360-degree attacks that aren't aimed. Written by S20-TBL, modified by BPzeBanshee.
 * @param {Real} density Description
 * @param {Real} origin_x Description
 * @param {Real} origin_y Description
 * @param {Real} obj_dist Description
 * @param {Asset.GMObject} b_type Description
 * @param {Real} b_speed Description
 * @param {Bool} imageaim Description
 */
function scr_circleshot02(density,origin_x,origin_y,obj_dist,b_type,b_speed,imageaim) {
	// written by S20-TBL
	//this is for 360 attacks that aren't supposed to be aimed.
	var _x, _y, _bullet;
	for (var i=0; i<360; i+=density)  // controls the density of the bullet ring; smaller numbers mean tighter patterns
	    {
	    _x = origin_x + lengthdir_x(obj_dist, i);   
	    _y = origin_y + lengthdir_y(obj_dist, i);
	    // ^^ distance from the origin at which the bullet will spawn
    
	    // negative speed value will make bullet go towards origin of object firing it
	    _bullet = instance_create_layer(_x, _y, global.lay_bullets, b_type);
	    _bullet.speed = b_speed; 
	    _bullet.direction = i;
	    if imageaim == true _bullet.image_angle = i;
	    }
}
