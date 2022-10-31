var dead = instance_create_layer(x,y,layer,obj_en8_dead);
dead.image_angle = image_angle;

// adding points to score based on chain count and adding to chain.
scr_addscore(750,180,1);

instance_destroy();