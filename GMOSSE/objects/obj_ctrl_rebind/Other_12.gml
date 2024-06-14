/// @description  FIND ID(S) TO USE
/// @param S
rect_h = 60;
if mode == 1
    {
    // Fail this event if gamepads aren't even supported in this environment
    if gamepad_is_supported() == false
        {
        mode = 6;
        control = 3;
        msg = "Gamepads not supported\n on this system!";
        }  
    else mode = 2;
    }
if mode == 2
    {
    // Record old ID setting/preference in case, then reset ID
    old_id = global.joy_id[0];
    old_pr = global.joy_pref[0];
    global.joy_id[0] = -1;
    
    // Get number of pads, and their IDs, and stick them into an array
    var pad = 0;
    var num_of_pads = 0;
    while pad < gamepad_get_device_count()
        {
        if gamepad_is_connected(pad)
            {
            pad_list[num_of_pads] = pad;
            num_of_pads += 1;
            }
        pad += 1;
        }
    
    if num_of_pads == 0
        {
        // get out of this event and give an error
        mode = 6;
        control = 3;
        msg = "Gamepad not found!";
        }
        
    if num_of_pads == 1
        {
        // get out of this event and go to the rebind sequence
        global.joy_id[0] = pad_list[0];
        global.joy_pref[0] = global.joy_id[0];
        desc = scr_linebreak(gamepad_get_description(global.joy_id[0]),32,99);
        mode = 1;
        control = 3;
        }
        
    if num_of_pads > 1 
        {
        // See mode 2 below
        msg = chr(global.keycode_button1)+" to pick ID, "+chr(global.keycode_button2)+" aborts";
        min_s = 0;
        max_s = num_of_pads - 1;
        desc = "";
        select = min_s;
        mode = 3;
        }
    }
    
// Go to submenu if more than one controller is detected
if mode == 3
    {
    // Selection keys
    if (keyboard_check_pressed(global.keycode_left)) && select > min_s select -= 1;
    if (keyboard_check_pressed(global.keycode_right)) && select < max_s select += 1;
    
    // Display vars for current joy id
    if gamepad_is_connected(pad_list[select]) 
    desc = scr_linebreak(gamepad_get_description(pad_list[select]),32,99)
    else desc = "N/A";
    
    // Accept
    if (keyboard_check_pressed(global.keycode_button1))
        {
        global.joy_id[0] = pad_list[select];
        global.joy_pref[0] = global.joy_id[0];
        mode = 1;
        control = 3;
        }
        
    // Cancel
    if (keyboard_check_pressed(global.keycode_button2))
        {
        global.joy_id[0] = old_id;
        global.joy_pref[0] = old_pr;
        instance_destroy();
        }
    }

