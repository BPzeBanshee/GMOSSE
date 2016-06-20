///scr_fademusic(fadespeed)
if !instance_exists(obj_fade)
    {
    var f;
    f = instance_create(0,0,obj_fade);
    f.fade_amount = argument0;
    }
