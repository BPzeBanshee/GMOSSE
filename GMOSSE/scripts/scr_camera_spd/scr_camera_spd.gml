/// @description scr_camera_spd(xspd,yspd)
/// @param xspd
/// @param yspd
function scr_camera_spd(argument0, argument1) {
	/*
	scr_camera_spd, by BPzeBanshee

	This is a function to set the camera speed and delay
	values after having initialised the camera with
	scr_camera_init.
	*/
	if !instance_exists(obj_ctrl_camera) return -1;
	spd_x = argument0;
	obj_ctrl_camera.spd_x_init = spd_x;
	spd_y = argument1;



}
