if instance_exists(obj_player)
    {
    x = obj_player.x;
    y = obj_player.y - 8;
    timer += 1;
    if timer == 5 then instance_create_layer(x,y-8,layer,obj_sf_laser);
    if timer > 120 && instance_exists(obj_sf_laser)
        {
        if obj_sf_laser.image_xscale == 0 then event_user(0);
        }
    } 
else 
    {
    event_user(0);
    }

