// Don't bother doing anything if we're not actually playing
if !instance_exists(myhitbox) then exit;
var dirx = 0;
var diry = 0;

var ind = myctrl.side;
    
// Directional input
if global.jup[ind] then diry -= 1;
if global.jdown[ind] then diry += 1;
if global.jleft[ind] then dirx -= 1;
if global.jright[ind] then dirx += 1;

// Speed value
var spd = shipspeed;
if global.button3[ind]
    {
    if has_afterimage
		{
		var aft = instance_create_layer(x,y,layer,obj_afterimage);
		aft.sprite_index = afterimage_spr;
		}
    spd = slowshipspeed;
    }

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

