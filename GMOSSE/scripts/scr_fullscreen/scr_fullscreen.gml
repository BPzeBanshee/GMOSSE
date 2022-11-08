/*
scr_fullscreen() by BPzeBanshee
*/
/// @desc Simple toggle switch, call once to go fullscreen, call again to go back windowed. 
/// Disables display of cursor when fullscreen.
/// @param full
function scr_fullscreen(full) {
	window_set_fullscreen(full);

	if full
	then window_set_cursor(cr_none)
	else window_set_cursor(cr_default);

	with obj_ctrl_render alarm[1] = 1;
}