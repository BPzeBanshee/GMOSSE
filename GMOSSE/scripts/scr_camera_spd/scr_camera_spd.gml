// scr_camera_spd, by BPzeBanshee
/// @desc Set the camera speed values after having initialised the camera with scr_camera_init.
/// @param {real} xspd
/// @param {real} yspd
function scr_camera_spd(xspd,yspd) {
	if !instance_exists(obj_ctrl_camera) return -1;
	spd_x = xspd;
	obj_ctrl_camera.spd_x_init = spd_x;
	spd_y = yspd;
	return 0;
}