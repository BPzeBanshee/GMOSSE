// Behaviour
if image_xscale < 3
    {
    image_xscale += 0.1;
    image_yscale += 0.1;
    }
else if image_xscale < 5
    {
    image_xscale += 0.05;
    image_yscale += 0.05;
    }
   
if !instance_exists(v)
    { 
    v = instance_create_layer(x,y,layer,obj_warbird_volt);
    v.image_xscale = image_xscale-0.05;
    v.image_yscale = image_yscale-0.05;
    }
else
    {
    v.image_xscale = image_xscale-0.05;
    v.image_yscale = image_yscale-0.05;
    }

image_angle = random(360);
    
// Death timer
timer += 1;
if timer >= 300
    {
    image_alpha -= 0.1;
    if image_alpha <= 0 then instance_destroy();
    }

