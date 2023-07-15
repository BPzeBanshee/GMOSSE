if instance_exists(obj_ctrl_clear) then exit;

// Generating the formula variables
// no matter the x position in room should be between 0-320
var player_rp,player_pc,max_width;
if instance_exists(obj_player)
then player_rp = (obj_player.x - x) // 2P mode: lerp(player1.x,player2.x,0.5) - x
else player_rp = range / 2;
player_pc = player_rp / range; // player position as decimal percentage
max_width = range - view_width; // 80 assuming playable area of 320 wide

// Scrolling
for (var i=0;i<array_length(objects_to_scroll);i++)
    {
    with objects_to_scroll[i] if path_index == -1
        {
		x += spd_x;
	    y += spd_y;
        }
    }
x += spd_x; 
y += spd_y;

// Bounding omnidirectional speed values within the room
if x < 0 then spd_x = max(x,1)
else if x > room_width then spd_x = -min(x-room_width,1)
else spd_x = spd_x_init;

// The formula
var formula = (x + round(max_width * player_pc)); // 80 * decimal value as percentage
//formula = round(x + (max_width * player_pc)) - xo; // 80 * decimal value as percentage

var cam = view_get_camera(view_current);
var cx = camera_get_view_x(cam);
if cx < formula then cx = cx + (min(formula-cx,2));
if cx > formula then cx = cx - (min(cx-formula,2));
camera_set_view_pos(cam,cx,y);

