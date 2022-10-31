image_angle = direction;
if !scr_isonscreen() || !active then exit;

var aim;
if instance_exists(obj_hitbox)
    {
    var tar = instance_nearest(x,y,obj_hitbox);
    aim = point_direction(x,y,tar.x,tar.y);
    }
else aim = 270;
scr_turntoangle(aim,2.5);

if y > yview+240 exit;
timer += 1;
if timer >= 60
    {
    timer2 -= 1;
    if timer2 <= 0
        {
        scr_basicshot(x,y,global.lay_bullets,obj_bullet1,6,direction);
        scr_playsnd(snd_en_shot1,1);
        timer2 = 4;
        }
    }
if timer == 90 then timer = 0;