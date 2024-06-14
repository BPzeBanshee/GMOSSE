if !instance_exists(parent_id) instance_destroy();
if image_index > 0 image_index -= 0.25;
p_min = (sprite_width/2);
p_max = p_min + sprite_width/2;
y = (parent_id).y;
if direction == 0
    {
    image_xscale = 1;
    image_yscale = 1;
    x = (parent_id).x + (parent_id).hspeed + p;
    }
if direction == 180
    {
    image_xscale = -1;
    image_yscale = -1;
    p_min = -p_min;
    p_max = -p_max;
    x = (parent_id).x + (parent_id).hspeed - p;
    }
if hit == 0
    {
    if (parent_id).x + x < p_max p += 2;
    if (parent_id).x + x > p_max p = p_max;
    if (parent_id).x + x < p_min p = p_min;
    }
if hit == 1 timer += 1;
if timer >= 5
    {
    timer = 0;
    hit = 0;
    }

