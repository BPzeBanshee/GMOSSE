switch mode
    {
    case 0:
        {
        if input_mode == 1 then sprite_index = input_sprite;
        mode = input_mode;
        break;
        }
    case 1: // Animated pictures
        {
        image_speed = 0;
        if global.levelend == 1
            {
            image_index += input_speed1;
            if image_index == image_number then timer += 1;
            if timer == input_delay 
                {
                if global.paused then scr_unpause();
                room_goto(input_room);
                global.levelend = 0;
                }
            }
        else
            {
            global.nextroom = -1;
            image_index -= input_speed2;
            if image_index == 0 then instance_destroy();
            }
        break;
        }
    case 2: // Single colour
        {
        if global.levelend == 1
            {
            if alpha < 1 then alpha += input_speed1 else timer += 1;
            if timer > input_delay 
                {
                if global.paused then scr_unpause();
                room_goto(input_room);
                global.levelend = 0;
                }
            }
        else
            {
            global.nextroom = -1;
            alpha -= input_speed2;
            if alpha <= 0 then instance_destroy();
            }
        break;
        }
    case 3: // Single colour with 'STAGE x START' delay
        {
        if global.levelend == 1
            {
            draw_timer += 1;
            if alpha < 1 then alpha += min(1-alpha,input_speed1) else timer += 1;
            if timer > input_delay 
                {
                if global.paused then scr_unpause();
                room_goto(input_room);
                global.levelend = 0;
                }
            }
        else
            {
            global.nextroom = -1;
            alpha -= input_speed2;
            if alpha <= 0 then instance_destroy();
            }
        break;
        }
    }