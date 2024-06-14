// Aesthetics
image_angle = direction;
var thr = instance_create_depth(x,y,depth+1,obj_arxyne_shot2b);
thr.image_angle = image_angle;

// Turning laser behaviour
var angle = direction;
var target = instance_nearest(x,y,obj_en_parent);
if target != noone 
	{
	angle = point_direction(x,y,target.x,target.y);
	}
else speed += acceleration;

scr_turntoangle(angle,turnrate);
if direction != angle  
    {
    if turnrate < 10 turnrate += 1;
    }
else 
    {
    if speed < max_speed speed += acceleration; 
    if turnrate > 10 turnrate -= 1;    
    }