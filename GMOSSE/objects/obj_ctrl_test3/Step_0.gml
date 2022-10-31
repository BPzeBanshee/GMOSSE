// Updating position
x = obj_ctrl_camera.x;
y = obj_ctrl_camera.y;

// Boundary checking
if y <= 0
    {
    obj_ctrl_camera.y = 0;
    scr_camera_spd(0,0);
    }
    
    
if y == room_height/2
    {
    obj_ctrl_camera.range = 320;
    if obj_hitbox.x < room_width/2
        {
        //scr_camera_bound(0,80);
        obj_ctrl_camera.x = 0; 
        }
    else
        {
        //scr_camera_bound(room_width-320,room_width-240);
        obj_ctrl_camera.x = 320;
        }
    }

