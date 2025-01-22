/// @desc scr_draw_input()
function scr_draw_input() {
	/*
	scr_draw_input, by BPzeBanshee

	Only useful for input debugging purposes.
	*/

	// Setting font/color/alignment
	scr_draw_vars(global.fnt_default,fa_right,c_white);

	// Drawing text
	var xx = xview+240;
	var yy = yview+40;
	draw_text(xx,yy,"UP: "+string(global.jup));
	draw_text(xx,yy+8,"DOWN: "+string(global.jdown));
	draw_text(xx,yy+16,"LEFT: "+string(global.jleft));
	draw_text(xx,yy+24,"RIGHT: "+string(global.jright));
	draw_text(xx,yy+32,"B1: "+string(global.button1));
	draw_text(xx,yy+40,"B2: "+string(global.button2));
	draw_text(xx,yy+48,"B3: "+string(global.button3));
	draw_text(xx,yy+56,"B4: "+string(global.button4));

	// Drawing debug variables
	// make a separate object call this to determine globalvar transfer lag
	draw_text(xx,yy+72,"STEP: "+string(global.step));
}
