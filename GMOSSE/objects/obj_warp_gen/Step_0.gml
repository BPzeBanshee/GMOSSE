timer += 1;
if timer == 20
    {
	var xx = x+random_range(-5,5);
	var yy = y+random_range(-5,5);
    var w = instance_create_layer(xx,yy,layer,obj_warp);
    w.sprite_index = v;
    w.visible = visible;
    timer = 0;
    }
/*if keyboard_check_pressed(vk_space)
    {
    if v = spr_warp2c then v = spr_warp2 else v = spr_warp2c;
    }*/