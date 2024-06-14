/// @desc scr_pause_draw()
function scr_pause_draw() {
	/* 
	scr_pause_draw()
	For drawing the 'background' - all the paused enemies and stuff.
	*/
	if !sprite_exists(global.pause_img) exit;
	draw_sprite_ext(global.pause_img,0,xview,yview,1,1,0,c_white,1);
}