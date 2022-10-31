// Aesthetics
image_angle = direction;
var thr = instance_create_depth(x,y,depth+1,obj_xono_laser2);
thr.image_angle = image_angle;

// Enemy find code
timer += 1;
var angle = 90;
if timer < 120
    {
    var target = instance_nearest(x,y,obj_en_parent);
    if target != noone then angle = point_direction(x,y,target.x,target.y);
    }
    
// Movement code
scr_turntoangle(angle,turnrate);
if direction != angle  
    {
    if speed > min_speed then speed -= acceleration; 
    if turnrate < max_turnrate then turnrate += 1;
    }
else 
    {
    if speed < max_speed then speed += acceleration; 
    if turnrate > min_turnrate then turnrate -= 1;    
    }
        
// Death handling
if x < xview-40 || x > xview + 280 
|| y < yview-10 || y > yview + 360 
then instance_destroy();