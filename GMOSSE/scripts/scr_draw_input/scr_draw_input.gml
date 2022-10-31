/// @description scr_draw_input()
function scr_draw_input() {
	/*
	scr_displayinput, by BPzeBanshee

	THIS IS NOT USED ANYWHERE AND IS NOT NEEDED.
	USE ONLY FOR TESTING INPUTS IN DEBUGGING.
	*/

	// Setting font/color/alignment
	scr_draw_vars(global.fnt_default,fa_right,c_white);

	// Drawing text
	draw_text(xview+240,yview+40,"UP: "+string(global.jup));
	draw_text(xview+240,yview+48,"DOWN: "+string(global.jdown));
	draw_text(xview+240,yview+56,"LEFT: "+string(global.jleft));
	draw_text(xview+240,yview+64,"RIGHT: "+string(global.jright));
	draw_text(xview+240,yview+72,"B1: "+string(global.button1));
	draw_text(xview+240,yview+80,"B2: "+string(global.button2));
	draw_text(xview+240,yview+88,"B3: "+string(global.button3));
	draw_text(xview+240,yview+96,"B4: "+string(global.button4));

	// Drawing debug variables
	// make a separate object call this to determine globalvar transfer lag
	draw_text(xview+240,yview+104,("STEP: "+string(global.step)));
}
