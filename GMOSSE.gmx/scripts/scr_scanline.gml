///scr_scanline(mode)
/*
Scanline selection V2, by BPzeBanshee

Usage: scr_scanline(argument0)
argument0 = display mode

Requires: obj_ctrl_filter, necessary

Display mode 0 will show nothing.
Display mode 1 will show horizontal scanlines.
Display mode 2 will show vertical scanlines.
*/

// Error check
if argument0 < 0 || argument0 > 2 
then show_message("Error in scr_scanline: mode number not available");

globalvar filter_image,filter_alpha;

switch argument0
    {
    default: filter_image = -1; filter_alpha = 0; break;
    case 1: filter_image = spr_scanline_hori; filter_alpha = 0.5; break;
    case 2: filter_image = spr_scanline_vert; filter_alpha = 0.5; break;
    }
