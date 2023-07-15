step_towards_point(xview+120,yview+200,1);

// Clutch fix for Trident (banking anim)
if global.shipselect == 4
    {
    image_index = round(img);
    if img > 2 then img -= 0.25;
    if img < 2 then img += 0.25;
    }