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
- global.vertex_buffer_method
- global.alternate_sync
*/

// Set vertex buffer method 
//(0,1,2 matches vbm constants for now but use this as safety measure)
// 2 works better on shit Intel cards, 0 is what nvidia recommends for performance
var v;
switch global.vertex_buffer_method
    {
    case 0: v = vbm_fast; break;
    case 1: v = vbm_compatible; break;
    default: v = vbm_most_compatible; break;
    }
if display_get_windows_vertex_buffer_method() != v 
then display_set_windows_vertex_buffer_method(v);

// Set alternate sync (windows only thing, if normal vsync is wonky use this)
if display_get_windows_alternate_sync() != global.alternate_sync 
then display_set_windows_alternate_sync(global.alternate_sync);

// Fullscreen
scr_fullscreen(global.fullscreen);

// Vsync
scr_setdisplay(global.aa,global.vsync);

// Filtering
texture_set_interpolation(global.filter);


