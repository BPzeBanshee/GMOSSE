if instance_exists(target)
    {
    var px,py;
    px = target.x - xview;
    py = target.y - yview;
        
    if moving > 0
        {
        // Log player position in screenspace
        ds_queue_enqueue(qqx,px); //obj_player.x
        ds_queue_enqueue(qqy,py); //obj_player.y
        if moving = 1
            {
            // difference between player position and queue head (converted to worldspace)
            new_x = target.x - (xview+ds_queue_head(qqx)); //obj_player.x - ds_queue_head(qqx)
            new_y = target.y - (yview+ds_queue_head(qqy));
            }
        size += 1;
        }
        
    if moving = 2
        {
        x = target.x-new_x;
        y = target.y-new_y;
        }
        
    if size >= length
        {
        if moving = 1 
            {
            // Set position relative to screen
            x = xview + ds_queue_head(qqx);//ds_queue_head(qqx); 
            y = yview + ds_queue_head(qqy);//ds_queue_head(qqy);
            }
        ds_queue_dequeue(qqx); 
        ds_queue_dequeue(qqy);
        size -= 1;
        }
    }
else instance_destroy();

