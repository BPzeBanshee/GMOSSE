///scr_fullscreen(full)
/*
scr_fullscreen() by BPzeBanshee

Simple toggle switch, call once to go fullscreen,
call again to go back windowed.
Disables display of cursor when fullscreen.
*/
f = argument0;
window_set_fullscreen(f);

if f
then window_set_cursor(cr_none)
else window_set_cursor(cr_default);
