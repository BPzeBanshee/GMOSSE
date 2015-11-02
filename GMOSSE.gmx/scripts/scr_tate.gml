/*
scr_tate()
Based on Pieterator's TATE code from Aero Flux.
Restructured for GMOSSE/Warbird and offset glitches by BPzeBanshee.

Usage: scr_tate(mode)
mode 0 is normal, 1 is 270*, 2 is 180* & 3 is 90*

Requires:
Call scr_screen_init first in initialisation room
Call on Room Start for every other room
Use globalvars xview and yview for your text 
display and use either hardcoded variables for 
positions or force the view_xview and view_yview 
to an object position for scrolling shooters.
*/

// Error checking
if (argument0 = 1 || argument0 = 3) && window_get_width()=240 then exit;
if (argument0 = 0 || argument0 = 2) && window_get_height()=240 then exit;

// Offset variables and setting view angle based on argument 
switch argument0
    {
    case 0: view_angle[0]=0; break;
    case 1: view_angle[0]=90; break;
    case 2: view_angle[0]=180; break;
    case 3: view_angle[0]=270; break;
    default: show_message("Error in scr_TATE: mode number not available"); break;
    }

// Assigning new view variables    
xview = view_xview[0] + x_o;
yview = view_yview[0] + y_o;

/*if global.screen_adjust = 0
    { 
    scr_resize(global.win_size,1);
    global.screen_adjust = 1;
    }*/
    
