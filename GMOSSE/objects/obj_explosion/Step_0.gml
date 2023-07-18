// Explosion flicker (trap15's stupid idea)
if global.flicker == 1
    {
    frame += 1;
    if frame < 2 then visible = true else
        {
        visible = false;
        frame = 0;
        }
    }

// Compatibility with old GMOSSE explosions
if image_speed != 0.1 then image_angle = random(360);