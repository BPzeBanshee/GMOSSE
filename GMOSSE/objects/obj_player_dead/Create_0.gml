// Contra Yagawa Corps Eksploshunz by Michael Bay!
var _x, _y, _bullet;
for (var i = 0; i <= 360; i+=18)
    {
    _x = lengthdir_x(0,i)+x;
    _y = lengthdir_y(0,i)+y;
    _bullet[i] = instance_create_layer(_x,_y,layer,obj_explosion);
    _bullet[i].speed = random_range(1,4);
    _bullet[i].direction = i;
    _bullet[i].image_blend = c_fuchsia;
    _bullet[i].image_speed = 0.1;
    _bullet[i].image_xscale = 1;
    _bullet[i].image_yscale = 1;
    }
scr_snd_play(snd_exp3);

