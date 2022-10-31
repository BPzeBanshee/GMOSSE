scr_3D();
image_angle += 8;
z += z_speed;
if z >= 128
    {
    image_alpha = 1;
    var child = instance_create_layer(x,y,layer,obj_3Den2);
    child.image_angle = image_angle;
    child.z_speed = z_speed;
    instance_destroy();
    }