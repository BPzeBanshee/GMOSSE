/// @description scr_draw_input()
function scr_draw_input(playerid = 0) {
	/*
	scr_displayinput, by BPzeBanshee

	THIS IS NOT USED ANYWHERE AND IS NOT NEEDED.
	USE ONLY FOR TESTING INPUTS IN DEBUGGING.
	*/

	// Setting font/color/alignment
	scr_draw_vars(global.fnt_default,fa_right,c_white);

	// Drawing text
	var xx = xview+240;
	var yy = yview+40;
	draw_text(xx,yy,"UP: "+string(global.jup[playerid]));
	draw_text(xx,yy+8,"DOWN: "+string(global.jdown[playerid]));
	draw_text(xx,yy+16,"LEFT: "+string(global.jleft[playerid]));
	draw_text(xx,yy+24,"RIGHT: "+string(global.jright[playerid]));
	draw_text(xx,yy+32,"B1: "+string(global.button1[playerid]));
	draw_text(xx,yy+40,"B2: "+string(global.button2[playerid]));
	draw_text(xx,yy+48,"B3: "+string(global.button3[playerid]));
	draw_text(xx,yy+56,"B4: "+string(global.button4[playerid]));

	// Drawing debug variables
	// make a separate object call this to determine globalvar transfer lag
	draw_text(xx,yy+72,("STEP: "+string(global.step)));
}
