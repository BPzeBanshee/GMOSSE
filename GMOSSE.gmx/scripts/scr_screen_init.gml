/*
scr_screen_init, by BPzeBanshee

Usage: scr_screen_init()

Arguments: none

Requires:
call scr_loadconfig first
or instead manually define:
- global.fullscreen
- global.vsync
- global.filter
- global.tate
- global.win_size
*/

// TATE offset/variable init
scr_tate_init();

// create global xview/yview vars    
scr_view_vars();

// X/Y port position within window, only change if using widescreen display stuff
globalvar xport,yport;
xport = 0;
yport = 0;

// Fullscreen
window_set_fullscreen(global.fullscreen);

// Vsync
scr_setdisplay(global.aa,global.vsync);

// Filtering
texture_set_interpolation(global.filter);

// Set room views adjusted for size multiplier
scr_view_update();
