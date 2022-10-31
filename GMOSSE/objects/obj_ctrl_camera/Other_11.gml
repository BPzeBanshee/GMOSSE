/// @description  Object to scroll array
objects_to_scroll[0] = obj_player;
objects_to_scroll[1] = obj_hitbox;
objects_to_scroll[2] = obj_afterimage;
objects_to_scroll[3] = obj_stock_bomb;
objects_to_scroll[4] = obj_en_air;
objects_to_scroll[5] = obj_bullettarget;
objects_to_scroll[6] = obj_popup;
objects_to_scroll[7] = obj_player_shot;

switch global.shipselect
    {
    case 1:
        {
        objects_to_scroll[8] = obj_xono_shothit;
        objects_to_scroll[9] = obj_xono_laser2;
        break;
        }
    case 2:
        {
        objects_to_scroll[8] = obj_warbird_shothit;
        objects_to_scroll[9] = obj_warbird_laser2;
        objects_to_scroll[10] = obj_warbird_volt;
        break;
        }
    case 3:
        {
        objects_to_scroll[8] = obj_bh_trace;
        objects_to_scroll[9] = obj_bh_traceorb;
        objects_to_scroll[10] = obj_bh_shothit;
        objects_to_scroll[11] = obj_bh_orb;
        break;
        }
    case 4:
        {
        objects_to_scroll[8] = obj_sf_shothit;
        break;
        }
    case 5:
        {
        objects_to_scroll[8] = obj_arxyne_shot2b;
        objects_to_scroll[9] = obj_arxyne_shot2c;
        break;
        }
    }