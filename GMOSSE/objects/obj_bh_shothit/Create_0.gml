sprite_index = spr_bh_shothit;

// TODO: remove object calls, have player bullet pass mode/color/etc through
if instance_exists(obj_player) 
then switch obj_player.weapon
	{
    case 1:
        {
        speed = 6;
        direction += irandom_range(-15,15);
        image_blend = obj_bh_orb.image_blend;
		break;
        }
    case 2:
        {
        speed = 1;
        image_blend = obj_bh_orb.image_blend;
		break;
        }
    case 3:
        {
        speed = 5;
        image_blend = obj_bh_orb.image_blend;
		break;
        }
    case 4:
        {
        speed = 4;
        direction = irandom(360);
        sprite_index = spr_en_thr;
        image_speed = 0.6;
		break;
        }
    case 5:
        {
        speed = 4;
        direction = irandom(360);
        image_blend = obj_bh_orb.image_blend;
		break;
        }
    case 6:
        {
        speed = 3;
        direction += irandom_range(-15,15);
        sprite_index = spr_explosion;
        image_xscale = 0.6;
        image_yscale = 0.6;
        image_blend = 5204479;
		break;
        }
    case 7:
        {
        speed = 3;
        image_blend = obj_bh_orb.image_blend;
		break;
        }
    }