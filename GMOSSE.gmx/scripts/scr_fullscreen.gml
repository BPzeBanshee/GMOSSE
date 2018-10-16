///scr_fullscreen(full)
/*
scr_fullscreen() by BPzeBanshee

Simple toggle switch, call once to go fullscreen,
call again to go back windowed.
Disables display of cursor when fullscreen.
*/
var f; f = argument0;
window_set_fullscreen(f);

if f
then window_set_cursor(cr_none)
else window_set_cursor(cr_default);

if global.use_new_renderer
then with obj_ctrl_render alarm[1] = 1;
else with obj_ctrl_render_old alarm[1] = 1;
