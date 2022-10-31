/// @description scr_pause_draw()
function scr_pause_draw() {
	/* 
	scr_pause_draw()

	CALL IN DRAW EVENT.

	For drawing the 'background' - all the paused enemies and stuff.
	accounts for offset and rotation position weirdness using xview/yview vars
	under the old render system. 

	Rotation may be changable via menu but as the picture doesn't change 
	until you unpause/repause again neither does the offsets for drawing it, 
	so we use tate_first as defined in scr_pause() rather than global.rotation.
	*/
	if !sprite_exists(global.pause_img) then exit;
	//scr_view_vars();
	draw_sprite_ext(global.pause_img,0,xview,yview,1,1,0,c_white,1);
}
