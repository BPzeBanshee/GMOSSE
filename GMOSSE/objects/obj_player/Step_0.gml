// Don't bother doing anything if we're not actually playing
if !instance_exists(myhitbox) exit;

// Get button inputs
up = global.jup;
down = global.jdown;
left = global.jleft;
right = global.jright;
b1 = global.button1;
b2 = global.button2;
b3 = global.button3;

// Speed value
var spd = shipspeed;
if b3
    {
    if has_afterimage
		{
		var aft = instance_create_layer(x,y,layer,obj_afterimage);
		aft.sprite_index = afterimage_spr;
		}
    spd = slowshipspeed;
    }
	
// Directional input
var dirx = 0;
var diry = 0;
if up diry -= 1;
if down diry += 1;
if left dirx -= 1;
if right dirx += 1;

// Now manipulate the player position
if dirx != 0 || diry != 0
    {
    var movedir = point_direction(0,0,dirx,diry);
    x += lengthdir_x(spd,movedir);
    y += lengthdir_y(spd,movedir);
    direction = movedir;
    }

// ...but keep the player within the view
x = clamp(x,xview+16,xview+240-16);
y = clamp(y,yview+16,yview+320-16);