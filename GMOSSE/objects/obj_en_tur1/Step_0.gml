image_angle = direction;
if !scr_isonscreen() || !active then exit;

var aim;
if instance_exists(obj_hitbox)
    {
    var tar = instance_nearest(x,y,obj_hitbox);
    aim = point_direction(x,y,tar.x,tar.y);
    }
else aim = 270;
if timer < 60 then scr_turntoangle(aim,2.5);

var xx,yy;
xx = x + lengthdir_x(sprite_width/2,direction);
yy = y + lengthdir_y(sprite_width/2,direction);

timer += 1;
if timer >= 60 && y < yview+240
    {
    timer2 -= 1;
    if timer2 <= 0
        {
        scr_spreadshot_aim(xx,yy,obj_bullet2,-1,25,3,5,image_angle,image_angle);
        scr_snd_play(snd_en_shot2,true);
        timer2 = 5;
        }
    }
    
if timer >= 90 then timer = 0;