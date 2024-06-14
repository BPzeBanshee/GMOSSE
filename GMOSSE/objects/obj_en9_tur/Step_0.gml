// Set target, then turn turret towards it
var aim = 270;
if instance_exists(obj_hitbox)
    {
    var tar = instance_nearest(x,y,obj_hitbox);
    aim = point_direction(x,y,tar.x,tar.y);
    }
if fire == false scr_turntoimageangle(aim,2);

// Bullet creation
timer += 1;
if (timer == 60 || timer == 75 || timer == 90) && scr_isonscreen()
    {
    fire = true;
    var xx = x + lengthdir_x(16,image_angle);
    var yy = y + lengthdir_y(16,image_angle);
    scr_basicshot(xx,yy,global.lay_bullets,obj_bullet3,5,image_angle);
    scr_snd_play(snd_en_shot4,true);
    }
if timer >= 120 || y > yview+270
    { 
    timer = 0; 
    fire = false;
    }