// Explosion flicker (trap15's stupid idea)
if global.flicker == 1
    {
    frame += 1;
    if frame < 2 visible = true else
        {
        visible = false;
        frame = 0;
        }
    }