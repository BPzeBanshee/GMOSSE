switch global.behaviour
    {
    case 2:
        {
        image_alpha = 0; 
        image_index = 3;
        direction = random(360);
        speed = 0;//random_range(0.1,1);//random_range(2,15);
        image_speed = 0;
        image_xscale = 0; 
        image_yscale = 0;
        }
    case 3: // Continue Screen (reverse of Main Menu)
        {
        direction = point_direction(x,y,xview+120,yview+160);
        image_index = 4;
        image_speed = -0.15;
        break;
        }
    }

