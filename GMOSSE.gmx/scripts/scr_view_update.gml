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
