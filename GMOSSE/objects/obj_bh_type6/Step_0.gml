var target = noone;
if position == 1
	{
	// Determining joystick input
	moving = 0;
	var xpos = 0;
	var ypos = 0;
	if global.jup then ypos -= 1;
	if global.jdown then ypos += 1;
	if global.jleft then xpos -= 1;
	if global.jright then xpos += 1;
	if (xpos != 0 or ypos != 0) && !global.button2 then moving = 1;

	// Program handling
	target = parent_id;
	if program == 1 then moving = 2;
	}
else
	{
	target = parent_id.option[position-1];
	moving = target.moving;
	program = target.program;
	length = 7;
	}

// Movement code
if instance_exists(target)
    {
    var px = target.x - xview;
    var py = target.y - yview;
        
    if moving > 0
        {
        // Log player position in screenspace
        ds_queue_enqueue(qqx,px);
        ds_queue_enqueue(qqy,py);
        if moving == 1
            {
            // difference between player position and queue head (converted to worldspace)
            new_x = target.x - (xview+ds_queue_head(qqx));
            new_y = target.y - (yview+ds_queue_head(qqy));
            }
        size += 1;
        }
        
    if moving == 2
        {
        x = target.x - new_x;
        y = target.y - new_y;
        }
        
    if size >= length
        {
        if moving == 1 
            {
            // Set position relative to screen
            x = xview + ds_queue_head(qqx);
            y = yview + ds_queue_head(qqy);
            }
        ds_queue_dequeue(qqx); 
        ds_queue_dequeue(qqy);
        size -= 1;
        }
    }