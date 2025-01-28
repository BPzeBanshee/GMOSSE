if device_mouse_check_button(0,mb_left) && !moving
    {
    moving = true;
    image_speed = 0.5;
    pos += 1; if pos > 4 pos = 0;
    switch pos
        {
        case 0: xx = 40; yy = 40; break;
        case 1: xx = 40; yy = 280; break;
        case 2: xx = 200; yy = 280; break;
        case 3: xx = 200; yy = 40; break;
        case 4: xx = 120; yy = 160; break;
        }
    }
    
if moving
    {
    /*
    This works well enough but very arbitrary about speed values.
    Current mechanism does not allow for setting forced min/max values,
    to do so would require putting the lerps into some other variables
    and then containing them somehow.
    
    Zenodeath's mechanism works like this:
    if x != xx || y != yy
        {
        var s = clamp(point_distance(x,y,xx,yy)/4,0.1,5);
        mp_linear_step(xx,yy,s,0);
        }
    */
    
    x = lerp(x,xx,0.1);
    y = lerp(y,yy,0.1);
    if round(x) == xx && round(y) == yy
        {
        x = xx;
        y = yy;
        image_speed = 0;
        moving = false;
        }
    }