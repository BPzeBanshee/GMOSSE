scr_3D();
image_angle += 2;
z += z_speed;
if z >= 128
    {
    var en = instance_create_layer(x,y,layer,obj_3Den3a);
    en.image_angle = image_angle;
    instance_destroy();
    }