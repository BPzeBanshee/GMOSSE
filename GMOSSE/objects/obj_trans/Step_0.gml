switch mode
    {
    case 0:
        {
        if input_mode == 1
			{
			sprite_index = input_sprite;
			image_speed = 0;
			alpha = 1;
			}
        mode = input_mode;
        break;
        }
    case 1: // Animated sprite
        {
        if global.levelend == true
            {
            image_index += input_speed1;
            if image_index == image_number timer += 1;
            go_when_ready();
            }
        else
            {
            global.nextroom = -1;
            image_index -= input_speed2;
            if image_index == 0 instance_destroy();
            }
        break;
        }
    case 2: // Single colour
	case 3: // Single colour with 'STAGE 'x' START'
        {
        if global.levelend == true
            {
            if alpha < 1 alpha += min(1-alpha,input_speed1) else timer += 1;
            go_when_ready();
            }
        else
            {
            global.nextroom = -1;
            alpha -= input_speed2;
            if alpha <= 0 instance_destroy();
            }
        break;
        }
    }