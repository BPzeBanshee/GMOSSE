scr_3D();
z -= z_speed;
image_angle += 2;
image_alpha -= 0.01;

explosiontimer += 1;
if explosiontimer < 5 then instance_create_layer(x,y,layer,obj_explosion);
if image_alpha < 0.01 then instance_destroy();