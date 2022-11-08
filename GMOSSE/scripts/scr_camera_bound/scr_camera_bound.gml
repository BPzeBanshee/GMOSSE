/*
scr_camera_bound(), by BPzeBanshee
*/
/// @desc Sets left and right x boundaries for wobble scroll.
/// @param {real} left
/// @param {real} right
function scr_camera_bound(left, right) {
	if !instance_exists(obj_ctrl_camera) return -1;
	left_bound = real(left);
	right_bound = real(right);
}