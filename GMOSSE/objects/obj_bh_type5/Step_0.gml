if image_angle > 360 then image_angle = 0;
if image_angle < 0 then image_angle = 360;

if global.button2 && !hook
    {
    program = !program;
    hook = 1;
    }
if !global.button2 then hook = 0;

if program = 0
    {
    if position = 1
        {
        if (global.jup)
            {
            if image_angle != 270 then angle += 11.25;
            }
        if (global.jdown)
            {
            if image_angle != 90 then angle -= 11.25;
            }
        }
    else
        {
        if (global.jup)
            {
            if image_angle != 270 then angle -= 11.25;
            if angle < 0 angle = 348.75;
            }
        if (global.jdown)
            {
            if image_angle != 90 then angle += 11.25;
            if angle > 360 angle = 11.25;
            }
        }
    scr_turntoimageangle(angle,11.25);
    }

if instance_exists(obj_player)
    {
    if position = 1
        {
        x = obj_player.x-25;
        y = obj_player.y;
        }
    else
        {
        x = obj_player.x+25;
        y = obj_player.y;
        }
    }

