/// @description  TOGGLE FULLSCREEN
// Not if alt keys are pressed, that'll terminate the game! :P
if keyboard_check_direct(vk_ralt) or keyboard_check_direct(vk_lalt) exit;

if window_get_fullscreen() = global.fullscreen 
then global.fullscreen = !global.fullscreen;
scr_fullscreen(global.fullscreen);

