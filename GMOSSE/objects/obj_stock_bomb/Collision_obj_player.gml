if other.bombs < other.max_bombs then other.bombs += 1 else
    {
    global.myscore += 5000;
    var a = instance_create_layer(x,y,layer,obj_popup);
    a.msg = "BONUS\n+5000";
    }
scr_snd_play(snd_click,true);
instance_destroy();