// Aesthetics
image_timer += 1;
if image_timer == 5
    {
    var e = instance_create_depth(x,y,depth+1,obj_bh_traceorb);
	e.image_blend = image_blend;
    image_timer = 0;
    }
        
// Angle sanitisation
if image_angle > 360 then image_angle = 0;
if image_angle < 0 then image_angle = 360;
if angle > 360 then angle = 0;
if angle < 0 then angle = 360;