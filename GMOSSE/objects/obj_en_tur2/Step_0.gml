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
if timer == 60 
    {
    scr_basicshot(x,y,global.lay_bullets,obj_bullet1,6,direction);
    scr_snd_play(snd_en_shot1,true);
    }
if timer == 75
    {
    scr_spreadshot_aim(x,y,obj_bullet1,-1,25,3,6,1,direction);
    scr_snd_play(snd_en_shot1,true);
    }
if timer == 90
    {
    scr_spreadshot_aim(x,y,obj_bullet1,-1,25,5,6,1,direction);
    scr_snd_play(snd_en_shot1,true);
    timer = 0;
    }