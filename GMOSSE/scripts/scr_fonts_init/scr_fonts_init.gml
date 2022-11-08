function scr_fonts_init() {
	/* FONTS */
	/* 
	Had to alter the font sprites and code
	to load them a fair bit to get them
	exactly as they were in GMOSSE/Zenohell.
	fnt_big remains without the correct amount
	of spacing but it looks better that way so
	I've left it for now. Unsure about fnt_score
	and fnt_litscore.
	*/

	var p,s;
	p = 1; // proportional font
	s = 1; // separation between font sprites in pixels
	/* 
	Studio 2.2.1.375 works best with s = -1 but still kinda borked,
	requires manually resizing font subimages to add space,
	confirmed fix incoming next release by YoYo
	*/

	// font used in Main Menu
	global.fnt_menu = font_add_sprite(spr_fnt_menu,ord(" "),p,s);

	// default font set
	if global.fonttype == 0  
	    {
	    global.fnt_default = font_add_sprite(spr_fnt_default,ord(" "),p,s);
	    global.fnt_debug = font_add_sprite(spr_fnt_debug,ord(" "),p,s);
	    global.fnt_little = font_add_sprite(spr_fnt_little,ord(" "),p,s);
	    global.fnt_big = font_add_sprite(spr_fnt_big,ord(" "),p,s);
	    global.fnt_shipselect = font_add_sprite(spr_fnt_shipselect,ord(" "),p,s);
	    }
    
	// Emerald Master's alternate font set    
	if global.fonttype == 1
	    {
	    global.fnt_default = font_add_sprite(spr_fnt_default_alt,ord(" "),p,s);
	    global.fnt_debug = font_add_sprite(spr_fnt_debug_alt,ord(" "),p,s);
	    global.fnt_little = font_add_sprite(spr_fnt_little_alt,ord(" "),p,s);
	    global.fnt_big = font_add_sprite(spr_fnt_big_alt,ord(" "),p,s);
	    global.fnt_shipselect = font_add_sprite(spr_fnt_shipselect_alt,ord(" "),p,s);
	    }
}