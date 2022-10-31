scr_3D();
image_angle += turnspeed;

// wrap around sides
if x < xview-16 then x = xview+256;
if x > xview+256 then x = xview-16;

// reset if below screen
if y > yview+320+sprite_width then event_user(dead);

