with obj_bullet_parent 
    {
    var c = instance_create_layer(x,y,layer,obj_bulletcancel);
    c.direction = direction;
    c.speed = speed;
    instance_destroy();
    }