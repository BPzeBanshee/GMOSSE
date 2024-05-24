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
obj_stock_bomb,obj_popup];
#region ship-specific objects to scroll
add_objs = function(shipnum) {
switch shipnum
    {
    case 1:
        {
        array_push(objects_to_scroll,obj_xono_shothit);
        array_push(objects_to_scroll,obj_xono_laser2);
        break;
        }
    case 2:
        {
        array_push(objects_to_scroll,obj_warbird_shothit);
        array_push(objects_to_scroll,obj_warbird_laser2);
        array_push(objects_to_scroll,obj_warbird_volt);
        break;
        }
    case 3:
        {
        array_push(objects_to_scroll,obj_bh_traceorb);
        array_push(objects_to_scroll,obj_bh_shothit);
        array_push(objects_to_scroll,obj_bh_orb);
        break;
        }
    case 4:
        {
        array_push(objects_to_scroll,obj_trident_shothit);
        break;
        }
    case 5:
        {
        array_push(objects_to_scroll,obj_arxyne_shot2b);
        array_push(objects_to_scroll,obj_arxyne_shot2c);
        break;
        }
    }
}
if instance_number(obj_ctrl_game) > 1
	{
	for (var i=0;i<2;i++) add_objs(global.shipselect[i]);
	}
else add_objs(global.shipselect[global.myside]);
#endregion