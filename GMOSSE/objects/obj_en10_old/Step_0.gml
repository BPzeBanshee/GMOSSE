if y > yview-(sprite_height/2) timer += 1;
if timer > 60
    {
    direction += 2;
    if spd < 10 spd += 0.25;
    scr_basicshot(x,y,global.lay_bullets,obj_en10_beam,spd,direction);
    scr_basicshot(x,y,global.lay_bullets,obj_en10_beam,spd,direction+90);
    scr_basicshot(x,y,global.lay_bullets,obj_en10_beam,spd,direction+180);
    scr_basicshot(x,y,global.lay_bullets,obj_en10_beam,spd,direction+270);
    }