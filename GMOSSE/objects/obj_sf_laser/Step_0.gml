timer += 1;
if instance_exists(obj_sf_bomb)
    {
    if image_xscale < 1 && obj_sf_bomb.timer < 120 then image_xscale += 0.1;
    if image_xscale > 0 && obj_sf_bomb.timer >= 120 then image_xscale -= min(0.1,image_xscale);
    x = obj_sf_bomb.x - 1;
    y = obj_sf_bomb.y - 8;
    }
else 
    {
    global.shipspeed = 4;
    global.slowshipspeed = 2;
    global.diagspeed = 4;
    global.sldiagspeed = 2;
    instance_destroy();
    }

