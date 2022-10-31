if !scr_isonscreen() exit;
timer += 1;
if timer == 60 && count <= 3
    {
    s = instance_create_depth(x,y,depth-1,obj_en_spawner2);
    s.image_angle = direction;
    s.spawn = spawn;
    }   
if timer == 180
    {
    count += 1;
    timer = 0;
    }
if instance_exists(s)
    {
    s.x = x;
    s.y = y;
    }