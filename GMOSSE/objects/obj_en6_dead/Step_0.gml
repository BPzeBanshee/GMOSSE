if !visible switch mode
    {
    case 1: image_index = 0; visible = true; break;
    case 2: image_index = 1; visible = true; break;
    case 3: image_index = 2; visible = true; break;
    }
image_angle += angle;
image_alpha -= 0.01;
if image_alpha < 0.01 instance_destroy();