// THIS IS OUTDATED, SEE OBJ_CTRL_FILTER
/************Scanline Generator in Game Maker**********
Created by BPzeBanshee

Usage: scr_scanline(argument0)
argument0 = display mode

Requires: 
- call in Draw event
- use of scr_screen_init if using view offet
(otherwise remove x_o and y_o from view code here)
- bkg_scanline1 && bkg_scanline2 background images
- You not using background layer 7 for anything.

Display mode 0 will show nothing.
Display mode 1 will show horizontal scanlines.
Display mode 2 will show vertical scanlines.

WARNING!
Generates headaches. Looks like crap combined with
window resize upscaling.
******************************************************/

// Error checker. give or take 1 for mode.
if argument0 < 0 or argument0 > 3 show_message("Error in scr_scanline: mode number not available");
scanline_layer = 7;
switch argument0
    {
    case 0: // Nothing
        {
        background_index[scanline_layer]=0; 
        background_visible[scanline_layer]=0;
        background_foreground[scanline_layer]=0;
        background_vspeed[scanline_layer]=0; 
        background_hspeed[scanline_layer]=0;
        break;
        }
    case 1: // Standard Horizontal Scanlines
        {
        background_index[scanline_layer]=bkg_scanline1; 
        background_vspeed[scanline_layer]=0; 
        background_hspeed[scanline_layer]=0;
        break;
        }
    case 2: // Standard Vertical Scanlines
        {
        background_index[scanline_layer]=bkg_scanline2; 
        background_vspeed[scanline_layer]=0; 
        background_hspeed[scanline_layer]=0;
        break;
        }
    }
scr_view_vars();
background_x[scanline_layer]=xview;
background_y[scanline_layer]=yview;
background_alpha[scanline_layer]=1;
