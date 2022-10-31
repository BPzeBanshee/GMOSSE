if visible = 0 switch mode
    {
    case 1: image_index = 0; visible = 1; break;
    case 2: image_index = 1; visible = 1; break;
    case 3: image_index = 2; visible = 1; break;
    }
image_angle += angle;
image_alpha -= 0.01;
if image_alpha < 0.01 then instance_destroy();

