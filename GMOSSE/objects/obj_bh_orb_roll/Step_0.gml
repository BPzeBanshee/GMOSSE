// Orbit around the player object. 
// X and Y are offset to orbit based on center of player sprite. 
if instance_exists(parent_id)
    {
    orbit_angle -= orbit_speed; 
    if orbit_angle < 0 orbit_angle = 360;
    if orbit_angle > 360 orbit_angle = 0;
	
	// if position == 2 then 180 else 0
	var offset = position == 2 ? 180 : 0;
	x = parent_id.x + lengthdir_x(orbit_radius,orbit_angle+offset);
	y = parent_id.y + lengthdir_y(orbit_radius,orbit_angle+offset);
    //x = parent.x + orbit_radius * cos(orbit_angle * pi / 180); 
    //y = parent.y - orbit_radius * sin(orbit_angle * pi / 180);
    image_angle = program == 1 ? orbit_angle+offset : 90;
    }