//if image_angle > 360 then image_angle = 0;
//if image_angle < 0 then image_angle = 360;
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

if instance_exists(parent_id)
    {
    if position == 1
        {
        x = parent_id.x-25;
        y = parent_id.y;
        }
    else
        {
        x = parent_id.x+25;
        y = parent_id.y;
        }
    }

