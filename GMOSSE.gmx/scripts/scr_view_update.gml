/*
scr_screen_update(restartroom), by BPzeBanshee

WARNING! BY GM LIMITATIONS THIS
REQUIRES AT LEAST A ROOM RESTART!
SET YOUR CONTROLLERS UP ACCORDINGLY!

Purpose:
Cycles through rooms by index and updates
view configuration according to current
config settings.

Arguments:
None
*/
scr_tate_init();
w = win_w*global.win_size;
h = win_h*global.win_size;
window_set_size(w,h);
surface_resize(application_surface,w,h);
scr_tate(global.tate);

// update view vars for current room
view_xview[0] = -x_o; view_yview[0] = -y_o;
view_wview[0] = win_w; view_hview[0] = win_h;
view_xport[0] = xport; view_yport[0] = yport;
view_wport[0] = w; view_hport[0] = h;

i=room_first;
while i != -1
    {
    if i != rm_init
        {
        room_set_view(i,0,true,-x_o,-y_o,win_w,win_h,xport,yport,w,h,0,0,0,0,noone);
        room_set_view_enabled(i,true); 
        }
    i = room_next(i);
    }
