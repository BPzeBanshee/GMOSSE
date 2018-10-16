///scr_setdisplay(aa,vsync)
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
    scr_console(string(set_aa)+"xAA unsupported by your card");
    return -1;
    }
display_reset(set_aa,argument1);

// Update obj_ctrl_render accordingly
// display_reset resets texture_set_interpolation
if global.use_new_renderer then with obj_ctrl_render 
    {
    event_user(0); // display_reset also resets window size apparently, goddamn
    alarm[1] = 2;
    }
else with obj_ctrl_render_old alarm[1] = 2;

// Done!
return 0;
