if instance_exists(parent) 
    {
    image_angle = (parent).image_angle;
    direction = (parent).image_angle;
    
	// TODO: why was this comment here?
    //if (parent.parent).weapon != 5
    if (!global.button1)
        {
        image_speed = 0;
        image_index -= 1;
        if image_index < 1 then instance_destroy();
        }
    if (global.button1) then image_speed = 0.5;
    }
else instance_destroy();