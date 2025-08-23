hook = true;
choice = 0;

ship_img = [];
switch obj_shipselect.selection
	{
	case 1: ship_img = [spr_xono,spr_xono_alt,spr_xono_alt2]; break;
	case 5: ship_img = [spr_arxyne,spr_arxyne_alt]; break;
	default: instance_destroy(); break;
	}
	
arrlen = array_length(ship_img);
ship_totalwidth = 40 * arrlen;

for (var i=0; i<arrlen; i++)
	{
	ship_index[i] = sprite_get_number(ship_img[i])-1;
	}