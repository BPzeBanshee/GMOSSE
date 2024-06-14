scr_3D();
z -= z_speed;
image_angle -= 2;
image_alpha -= 0.01;

var randomplace = irandom(10) - irandom(10);
explosiontimer += 1;
if explosiontimer < 5 instance_create_layer(x+randomplace,y+randomplace,layer,obj_explosion);

if image_alpha < 0.01 instance_destroy();