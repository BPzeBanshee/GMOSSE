//if image_angle > 360 then image_angle = 0;
//if image_angle < 0 then image_angle = 360;
if program == 0
    {
	var xpos = 0;
	var ypos = 0;
	if global.jup then ypos -= 1;
	if global.jdown then ypos += 1;
	if global.jleft then xpos -= 1;
	if global.jright then xpos += 1;
	if xpos != 0 or ypos != 0 then scr_turntoimageangle(point_direction(0,0,xpos,ypos)+180,11.25);
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

