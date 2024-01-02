if image_angle > 360 then image_angle = 0;
if image_angle < 0 then image_angle = 360;

if global.button2 && !hook
    {
    program = !program;
    hook = true;
    }
if !global.button2 then hook = false;

if program == 0
	{
	var ypos = 0;
	if global.jup then ypos -= 1;
	if global.jdown then ypos += 1;
	
	var angle = 90;	
	if ypos != 0 
		{
		// ternary operator: if position == 1 then 270 else -90
		if ypos == 1 then angle = position == 1 ? 270 : -90;
		scr_turntoimageangle(angle,11.25);
		}
	}

/*if program == 0
    {
    if position == 1
        {
        if (global.jup)
            {
            if image_angle != 90 then angle -= 11.25;
            }
        if (global.jdown) 
            {
            if image_angle != 270 then angle += 11.25;
            }
        }
    else
        {
        if (global.jup)
            {
            if image_angle != 90 then angle += 11.25;
            if angle > 360 angle = 11.25;
            }
        if (global.jdown)
            {
            if image_angle != 270 then angle -= 11.25;
            if angle < 0 angle = 348.75;
            }
        }
    scr_turntoimageangle(angle,11.25);
    }*/

if instance_exists(parent)
    {
    if position == 1
        {
        x = parent.x-25;
        y = parent.y;
        }
    else
        {
        x = parent.x+25;
        y = parent.y;
        }
    }

