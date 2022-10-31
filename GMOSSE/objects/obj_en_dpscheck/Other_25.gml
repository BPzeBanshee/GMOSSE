var dead = instance_create_layer(x,y,layer,obj_en1_dead);
dead.image_angle = image_angle;

// adding points to score based on chain count and adding to chain.
scr_addscore(500,180,1);

instance_destroy();