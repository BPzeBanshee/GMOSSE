/// @description scr_draw_vars(font,align,color)
/// @param font
/// @param align
/// @param color
function scr_draw_vars(argument0, argument1, argument2) {
	/*
	scr_draw_vars(), by BPzeBanshee

	What it does:
	Does a few extra lines of code here, so you don't have to.
	Kind of a Macro command to do multiple draw-related settings at once.

	Call at the beginning of every Draw event
	*/
	draw_set_font(argument0);
	draw_set_halign(argument1);
	draw_set_color(argument2);



}
