// GMS draw_set_alpha applies to sprites too, ensure we get existing alpha and set it back
var old_alpha = draw_get_alpha();

// Draw black box to cover stage background
if bkg_alpha > 0
	{
	draw_set_alpha(bkg_alpha);
	draw_set_color(c_black);
	draw_rectangle(xview,yview,xview+240,yview+320,0);
	}

// Draw stage clear text
if txt_alpha > 0
	{
	draw_set_alpha(txt_alpha);
	scr_draw_vars(global.fnt_big,fa_center,c_white);
	draw_text(xview+120,yview+70,"STAGE "+stage+" CLEAR!");
	}

// Return screen alpha to previous values
draw_set_alpha(old_alpha);