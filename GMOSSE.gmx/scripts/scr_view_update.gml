/*
scr_view_update(), by BPzeBanshee

Purpose:
Cycles through rooms by index and updates
view configuration according to current
config settings.

Arguments:
None
*/
// renew some tate vars first
scr_tate_init();

// store original window angle for later
var angle_first;
angle_first = view_angle[0];

// resize application surface and rotate view based on vars
w = win_w*global.win_size;
h = win_h*global.win_size;
window_set_size(w,h);
surface_resize(application_surface,w,h);
scr_tate(global.tate);

// now we update view vars for current room
// first, determine if angle has changed and apply offset to current view if so
if view_angle[0] != angle_first then 
if global.tate = 1 || global.tate = 3
    {
    view_xview[0] -= t_o; 
    view_yview[0] += t_o;
    }
else
    {
    view_xview[0] += t_o; 
    view_yview[0] -= t_o;
    }
    
// adjust width, etc
view_wview[0] = win_w; view_hview[0] = win_h;
view_xport[0] = xport; view_yport[0] = yport;
view_wport[0] = w; view_hport[0] = h;
show_debug_message(string(w)+","+string(h));
// and finally update view vars for every other room
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
