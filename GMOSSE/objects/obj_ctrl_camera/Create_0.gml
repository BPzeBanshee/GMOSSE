/*
TODO:
Find a way to account for player sprite offset
in the formula so we can get xview = 0 and xview = 80
*/

range = 320;
view_width = 240;
spd_x_init = spd_x;
var cam = view_get_camera(view_current);
camera_set_view_pos(cam,((range - view_width) * 0.5),y);
xview = camera_get_view_x(cam);
yview = camera_get_view_y(cam);

objects_to_scroll[0] = noone; // shut up Feather
event_user(1);