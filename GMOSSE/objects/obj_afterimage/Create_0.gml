switch global.shipselect 
    {
    case 1: sprite_index = spr_xono_aft; break;
    case 2: sprite_index = spr_warbird_aft; break;
    case 3: instance_destroy(); break; // Busterhawk has no afterimage, do nothing here
    case 4: sprite_index = spr_trident_aft; break;
    case 5: instance_destroy(); break; // Arxyne has no afterimage, do nothing here
    }

