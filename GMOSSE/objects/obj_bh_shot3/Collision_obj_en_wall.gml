move_bounce_all(false);
bounce += 1;
if bounce > 8
    {
    instance_create_layer(x,y,layer,obj_bh_shothit);
    instance_destroy();
    }