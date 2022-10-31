if global.bombs == global.max_bombs
    {
    global.myscore += 5000;
    var a = instance_create_layer(x,y,layer,obj_popup);
    a.msg = "BONUS\n+5000";
    }
if global.bombs < global.max_bombs then global.bombs += 1;
scr_playsnd(snd_click,0);
instance_destroy();