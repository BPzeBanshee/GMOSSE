if !instance_exists(parent) then instance_destroy();
if image_index > 0 then image_index -= 0.25;
p_min = (sprite_width/2);
p_max = p_min + sprite_width/2;
y = (parent).y;
if direction == 0
    {
    image_xscale = 1;
    image_yscale = 1;
    x = (parent).x + (parent).hspeed + p;
    }
if direction == 180
    {
    image_xscale = -1;
    image_yscale = -1;
    p_min = -p_min;
    p_max = -p_max;
    x = (parent).x + (parent).hspeed - p;
    }
if hit == 0
    {
    if (parent).x + x < p_max then p += 2;
    if (parent).x + x > p_max then p = p_max;
    if (parent).x + x < p_min then p = p_min;
    }
if hit == 1 then timer += 1;
if timer >= 5
    {
    timer = 0;
    hit = 0;
    }

