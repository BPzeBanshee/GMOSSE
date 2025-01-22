if instance_exists(parent_id)
    {
	if program == 0
	    {
		var xpos = 0;
		var ypos = 0;
		if parent_id.up ypos -= 1;
		if parent_id.down ypos += 1;
		if parent_id.left xpos -= 1;
		if parent_id.right xpos += 1;
		if xpos != 0 or ypos != 0 scr_turntoimageangle(point_direction(0,0,xpos,ypos)+180,11.25);
	    }
	
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