scr_snd_play(snd_exp2);
var e;
repeat 3
    {
    e = instance_create_depth(x,y,depth-1,obj_explosion);
    e.direction = irandom(360);
    e.speed = irandom(3);
    }
scr_addscore(200,180,1);
with parent_id tur_count -= 1;
instance_destroy();