enabled = true; // toggle this to false to disable universal input

recording_gif = false;
gif_timer = 0;
mygif = -1;

find_new_pad = function()
	{
	global.joy_id = -1; // Nuke old ID
            
    var count = 0; 
    var pad = 0; 

    // Try to find and pick the first available gamepad
    while pad < gamepad_get_device_count()
        {
        if gamepad_is_connected(pad) 
            {
            if global.joy_id == -1 global.joy_id = pad;
            count += 1;
            }
        pad += 1;
        }
                
    // Report result to console
    if pad == gamepad_get_device_count() && global.joy_id == -1
    trace("Failed to find any joystick/gamepads")
    else trace(string(count)+" Pads found, picked first available ID: "+string(pad)+" ("+gamepad_get_description(pad)+")");
	}