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

objects_to_scroll = [obj_player,obj_hitbox,
obj_player_shot,obj_afterimage,
obj_bullettarget,obj_en_air,
obj_stock_bomb,obj_popup,obj_misc_scrollable];

// Old superwide test room code, might be useful to someone
/*if range == 640
    {
    range = 320;
    if player_rp > range then x = 320 else x = 0;
    }
else
    {
    range = 640;
    x = 0;
    }*/