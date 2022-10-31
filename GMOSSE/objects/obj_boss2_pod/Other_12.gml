//aim = point_direction(x,y,obj_hitbox.x,obj_hitbox.y);
var aim = direction;
if alt == 0
    {
    alt = 1;
    spd = 3;
    repeat 5
        {
        scr_basicshot(x,y,global.lay_bullets,obj_bullet1,spd,aim);
        scr_basicshot(x,y,global.lay_bullets,obj_bullet1,spd,aim+20);
        scr_basicshot(x,y,global.lay_bullets,obj_bullet1,spd,aim-20);
        spd += 0.5;
        }
    }
else
    {
    alt = 0;
    spd = 3;
    repeat 5
        {
        scr_basicshot(x,y,global.lay_bullets,obj_bullet1,spd,aim+10);
        scr_basicshot(x,y,global.lay_bullets,obj_bullet1,spd,aim-10);
        spd += 0.5;
        }
    }
scr_playsnd(snd_en_shot1,1);