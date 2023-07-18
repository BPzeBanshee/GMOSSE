// Orbit around the player object. 
// X and Y are offset to orbit based on center of player sprite. 
if instance_exists(obj_player)
    {
    orbit_angle -= orbit_speed; 
    if orbit_angle < 0 then orbit_angle = 360;
    if orbit_angle > 360 then orbit_angle = 0;
    x = obj_player.x + orbit_radius * cos(orbit_angle * pi / 180); 
    y = obj_player.y - orbit_radius * sin(orbit_angle * pi / 180);
    if global.button2 && !hook
        {
        hook = 1;
        program = !program;
        }
    if !global.button2 then hook = 0;
    if program == 1 then image_angle = orbit_angle else image_angle = 90;
    }

