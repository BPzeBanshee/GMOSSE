// Create turret
if y > yview-(sprite_height/2) && !made
    {
    tur = instance_create_depth(x,y,depth-1,obj_en9_tur);
    tur.image_angle = 270;
    tur.direction = 270;
    made = true;
    }
if made
    {
    tur.x = x;
    tur.y = y;
    }
    
// Death
if y > yview+320+(sprite_height/2) instance_destroy();