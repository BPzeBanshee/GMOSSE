x = obj_ctrl_camera.x;
y = obj_ctrl_camera.y;

// Top half (left)
if direction == 90 && y < 160-spd_y
    {
    direction = 45;
    scr_camera_spd(0.33,-0.33);
    }
// Top half (center)
if direction == 45 && y < spd_y
    {
    direction = 315;
    scr_camera_spd(0.33,0.33);
    }
// Top half (right)
if direction == 315 && x > room_width-320-spd_x
    {
    direction = 270;
    scr_camera_spd(0,0.33);
    }
    
// Bottom half (right)
if direction == 270 && y > room_height-480-spd_y
    {
    direction = 225;
    scr_camera_spd(-0.33,0.33);
    }
// Bottom half (center)
if direction == 225 && y > room_height-320-spd_y
    {
    direction = 135;
    scr_camera_spd(-0.33,-0.33);
    }
    
// start moving to topleft
if direction == 135 && x < spd_x
    {
    direction = 90;
    scr_camera_spd(0,-0.33);
    }
    
instance_deactivate_object(obj_en_wall);
instance_deactivate_object(obj_en_parent);
instance_activate_region(x-48,y-48,368,368,true);