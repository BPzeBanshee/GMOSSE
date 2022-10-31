scr_3D();
image_angle += z_speed;
z -= z_speed;
if z <= 128
    {
    speed = 0;
    var child = instance_create_layer(x,y,layer,obj_3Den1);
    child.image_angle = image_angle;
    instance_destroy();
    }

