if instance_exists(parent_id) 
    {
	var side = (parent_id.myctrl).side;
    image_angle = (parent_id).image_angle;
    direction = (parent_id).image_angle;
    
    if (!global.button1[side])
        {
        image_speed = 0;
        image_index -= 1;
        if image_index < 1 then instance_destroy();
        }
    if (global.button1[side]) then image_speed = 0.5;
    }
else instance_destroy();