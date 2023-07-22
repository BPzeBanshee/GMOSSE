/*
obj_star, one of the oldest aesthetic pieces of GMOSSE

mode 0 = unused
mode 1 = shipselect (falling down from top)
mode 2 = main menu (center in going out)
mode 3 = reverse 2 (edge going in center)
mode 4 = unused
*/
mode = 0;
init = function(_mode){
mode = _mode;
switch mode
    {
	case 1:
		{
		image_index = irandom(4);
		image_speed = 0;
		break;
		}
    case 2:
        {
        image_alpha = 0; 
        image_index = 3;
        direction = random(360);
        speed = random_range(0.1,1);
        image_speed = 0;
        image_xscale = 0.22; 
        image_yscale = 0.22;
		
		var rand_len = random(160);
		x = xview+120 + lengthdir_x(rand_len,direction);
		y = yview+160 + lengthdir_y(rand_len,direction);
		break;
        }
    case 3: // Continue Screen (reverse of Main Menu)
        {
        direction = point_direction(x,y,xview+120,yview+160);
        image_index = 4;
        image_speed = -0.15;
        break;
        }
    }
}
init(mode);