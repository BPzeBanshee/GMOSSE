/// @description scr_setdisplay(aa,vsync)
/// @param aa
/// @param vsync
function scr_setdisplay(argument0, argument1) {
	/*
	scr_setdisplay(aa,vsync)
	by BPzeBanshee

	Safely measures antialiasing values to use and applies them
	as well as the vsync function.
	*/
	var set_aa;
	switch argument0
	    {
	    default: set_aa = 0; break;
	    case 1: set_aa = 2; break;
	    case 2: set_aa = 4; break;
	    case 3: set_aa = 8; break;
	    }
	if argument0 > scr_max_aa()
	    {
	    trace(string(set_aa)+"xAA unsupported by your card");
	    return -1;
	    }
	display_reset(set_aa,argument1);

	// Update obj_ctrl_render accordingly
	with obj_ctrl_render 
	    {
	    alarm[1] = 2; // not only does it reset the filter, but
	    alarm[2] = 2; // display_reset also resets window size apparently, goddamn
	    }

	// Done!
	return 0;
}
