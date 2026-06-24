function scr_main_reset() {
	// TODO: rely less on GM, more manual care here
	global.nextroom = -1;
	scr_fonts_free();
	game_restart();
}