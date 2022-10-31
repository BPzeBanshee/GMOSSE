/// @desc Creates camera object and updates globalvars for managing it.
/// @param {Real} _left_bound
/// @param {Real} _right_bound
/// @param {Real} _xspd
/// @param {Real} _yspd
function scr_camera_init(_left_bound,_right_bound,_xspd,_yspd) {
	/*
	scr_camera_init, by BPzeBanshee
	updated to use input/bound code 11-4-16
	updated to GM2022 standards 31-10-22
	*/
	if instance_exists(obj_ctrl_camera) then return -1;
	globalvar left_bound,right_bound,spd_x,spd_y;
	// range of player x movement
	left_bound = _left_bound;
	right_bound = _right_bound; 
	spd_x = _xspd; // initial x speed
	spd_y = _yspd; // initial y speed
	
	// Layer doesn't matter too much for this object but defer to calling object just in case
	instance_create_layer(x,y,layer,obj_ctrl_camera);
}