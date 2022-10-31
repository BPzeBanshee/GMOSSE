vspeed = layer_get_vspeed(l) * 2.5;
if y > yview+320+(sprite_height/2)
    {
    x = random_range(obj_ctrl_camera.x,obj_ctrl_camera.x+320);
    y = yview-(sprite_height/2);
    image_index = irandom_range(0,3);
    }