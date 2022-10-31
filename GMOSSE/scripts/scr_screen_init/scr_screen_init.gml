function scr_screen_init() {
	/*
	scr_screen_init, by BPzeBanshee

	Usage: scr_screen_init()

	Arguments: none

	Requires:
	call scr_loadconfig first
	or instead manually define:
	- global.fullscreen
	- global.aa
	- global.vsync
	- global.filter
	*/
	// Set alternate sync (windows only thing, if normal vsync is wonky use this)
	/*if display_get_timing_method() == tm_sleep
		{
		if display_get_sleep_margin() != global.sleep_margin
		then display_set_sleep_margin(global.sleep_margin);
		}*/

	// Fullscreen
	scr_fullscreen(global.fullscreen);

	// Vsync
	var aa_max; aa_max = scr_max_aa();
	if global.aa > aa_max then global.aa = scr_max_aa();
	scr_setdisplay(global.aa,global.vsync);
}
