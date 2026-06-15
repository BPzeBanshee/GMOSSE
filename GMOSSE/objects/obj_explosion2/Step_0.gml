// Explosion flicker (trap15's stupid idea)
if global.flicker
    {
	if image_index > (image_number * 0.5) visible = !visible;
    /*frame += 1;
    if frame < 2 visible = true else
        {
        visible = false;
        frame = 0;
        }*/
    }