function scr_fonts_init() {
	// TODO: non-proportional font option ala Seibu?
	
	var p = true; // proportional font
	var s = 1; // separation between font sprites in pixels
	
	global.fnt_default = font_add_sprite(spr_fnt_default,ord(" "),p,s);
	global.fnt_little = font_add_sprite(spr_fnt_little,ord(" "),p,s);
	global.fnt_menu = font_add_sprite(spr_fnt_menu,ord(" "),p,s);
	global.fnt_shipselect = font_add_sprite(spr_fnt_shipselect,ord(" "),p,s);
	
	// continue/stage x start
	global.fnt_big = font_add_sprite(spr_fnt_big,ord(" "),p,s);
	
	// unused for now, maybe use for debug/medal numbers
	global.fnt_tiny = font_add_sprite(spr_fnt_tiny,ord(" "),p,s);
}

function scr_fonts_free() {
	var fonts = [global.fnt_default,global.fnt_little,global.fnt_menu,global.fnt_shipselect,global.fnt_big,global.fnt_tiny];
	for (var i=0;i<array_length(fonts);i++) font_delete(fonts[i]);
	return 0;
}