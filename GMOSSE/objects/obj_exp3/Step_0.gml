scr_3D();
z += zspd;

// Explosion flicker (trap15's stupid idea)
if global.flicker == 1
    {
    frame += 1;
    if frame < 2 then 
    visible = true else
        {
        visible = false;
        frame = 0;
        }
    }

