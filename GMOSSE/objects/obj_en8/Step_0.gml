// Behaviour
timer += 1;
if timer == 30 && y < yview+200
    {
    scr_basicshot(x,y,global.lay_bullets,obj_bullet1,5,shoot_angle);
    scr_snd_play(snd_en_shot1,true);
    shoot_angle += 32;
    if shoot_angle > 338 then shoot_angle = 0;
    timer = 28;
    }

// Aesthetic line of code to make it appear to rotate. 
image_angle += 2;

// Outside screen checking
if y > yview+320+(sprite_width/2) then instance_destroy();

