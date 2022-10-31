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
    if (global.jup && !global.jleft && !global.jright)
        {
        angle = 90;
        scr_turntoimageangle(angle,11.25);
        }
    if (global.jup && global.jleft)
        {
        angle = 135;
        scr_turntoimageangle(angle,11.25);
        }
    if (global.jleft && !global.jup && !global.jdown) 
        {
        angle = 180;
        scr_turntoimageangle(angle,11.25);
        }
    if (global.jdown && global.jleft)
        {
        angle = 225;
        scr_turntoimageangle(angle,11.25);
        }
    if (global.jdown && !global.jleft && !global.jright)
        {
        angle = 270;
        scr_turntoimageangle(angle,11.25);
        }
    if (global.jdown && global.jright)
        {
        angle = 315;
        scr_turntoimageangle(angle,11.25);
        }
    if (global.jright && !global.jup && !global.jdown)
        {
        angle = 0;
        scr_turntoimageangle(angle,11.25);
        }
    if (global.jup && global.jright)
        {
        angle = 45;
        scr_turntoimageangle(angle,11.25);
        }
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

