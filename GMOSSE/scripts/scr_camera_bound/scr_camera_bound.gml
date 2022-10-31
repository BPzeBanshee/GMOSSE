/// @description scr_camera_bound(left_bound,right_bound)
/// @param left_bound
/// @param right_bound
function scr_camera_bound(argument0, argument1) {
	/*
	scr_camera_bound(), by BPzeBanshee

	Sets left and right x boundaries for wobble scroll.
	*/
	if !instance_exists(obj_ctrl_camera) return -1;
	left_bound = real(argument0);
	right_bound = real(argument1);



}
