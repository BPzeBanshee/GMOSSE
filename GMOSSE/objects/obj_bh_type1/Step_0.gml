if instance_exists(parent_id)
    {
	var side = (parent_id.myctrl).side;
	if program == 0
	    {
		var xpos = 0;
		var ypos = 0;
		if global.jup[side] then ypos -= 1;
		if global.jdown[side] then ypos += 1;
		if global.jleft[side] then xpos -= 1;
		if global.jright[side] then xpos += 1;
		if xpos != 0 or ypos != 0 then scr_turntoimageangle(point_direction(0,0,xpos,ypos),11.25);
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

