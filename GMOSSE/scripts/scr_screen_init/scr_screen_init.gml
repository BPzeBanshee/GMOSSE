function scr_screen_init() {
	/*
	scr_screen_init, by BPzeBanshee

	Usage: scr_screen_init()

	Arguments: none

	Requires:
	call scr_config_load first
	or instead manually define:
	- global.fullscreen
	- global.aa
	- global.vsync
	- global.alternate_sync
	- global.sleep_margin
	*/
	// Set timing method (windows only thing, if normal vsync is wonky use this)
	var scr_method = tm_countvsyncs;
	if global.alternate_sync == true
	scr_method = tm_sleep;
	
	if display_get_timing_method() != scr_method 
	display_set_timing_method(scr_method);

	// Set sleep cycle to use if using sleep timing method
	if scr_method == tm_sleep
		{
		if display_get_sleep_margin() != global.sleep_margin
		display_set_sleep_margin(global.sleep_margin);
		}

	// Fullscreen
	scr_fullscreen(global.fullscreen);

	// Vsync
	var aa_max = scr_max_aa();
	if global.aa > aa_max 
	global.aa = scr_max_aa();
	scr_setdisplay(global.aa,global.vsync);
}