if ind == 0
    {
    if x < xview+120 x += 6;
    }
else
    {
    if x > xview+120 x -= 6;
    }
    
image_index += spd;
if image_index > ind+1 image_index = ind;