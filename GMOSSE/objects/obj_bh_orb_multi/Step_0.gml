if program == 0
	{
	var ypos = 0;
	if parent_id.up ypos -= 1;
	if parent_id.down ypos += 1;
	
	var angle = 90;	
	if ypos != 0 
		{
		// ternary operator: if position == 1 then 270 else -90
		if ypos == 1 angle = position == 1 ? 270 : -90;
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

