// Attack handling (it's a simple spinning one)
atk_timer -= 1;
if atk_timer == 0 && y < yview+200
    {
    scr_basicshot(x,y,global.lay_bullets,obj_bullet1,2,image_angle+shoot_angle);
    scr_snd_play(snd_en_shot1,true);
    shoot_angle += 45;
    if shoot_angle > 360 shoot_angle = 0;
    atk_timer = 5;
    }

// Aesthetic line of code to make it appear to rotate. 
image_angle += 1;

// Death handling
if y > yview + 360 instance_destroy();

