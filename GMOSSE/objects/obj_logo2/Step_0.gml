if ind = 0
    {
    if x < xview+120 then x += 6;
    }
else
    {
    if x > xview+120 then x -= 6;
    }
    
    
image_index += spd;
if image_index > ind+1 then image_index = ind;

