/// @description  CONTINUE SCREEN
switch side
    {
    case 1: // top
        {
        speed = 6;
        if y >= yview+160 instance_destroy(); 
        break;
        } 
    case 2: // left
        {
        speed = 4;
        if x >= xview+120 instance_destroy();
        break;
        } 
    case 3: // bottom
        {
        speed = 6;
        if y <= yview+160 instance_destroy();
        break;
        } 
    case 4: // right
        {
        speed = 4;
        if x <= xview+120 instance_destroy();
        break;
        } 
    }
if image_index < 1 image_speed = 0;

