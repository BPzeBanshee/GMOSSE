/// @description  DEFINE JOY BUTTONS (NEW SYSTEM)
/// @param NEW SYSTEM
if !gamepad_is_connected(global.joy_id[0]) mode = 6;

switch mode
    {
    case 1: msg = "Press a button for SHOT"; break;
    case 2: msg = "Press a button for BOMB"; break;
    case 3: msg = "Press a button for FOCUS"; break;
    case 4: msg = "Press a button for PAUSE"; break;
    case 5: instance_destroy(); break;
    }

timer += 1;
if timer > 30
    {
    if mode < 6
        {
        // gamepad_* buttons range from 0 upward
        for (var i=0; i<gamepad_button_count(global.joy_id[0]); i+=1) 
            {
            //gamepad_button_value exists for analog buttons/triggers with button states
            if gamepad_button_check(global.joy_id[0],i) joy_key = i;
            }
        if joy_key < 0 exit;
        switch mode
            {
            case 1: global.joy1 = joy_key; break;
            case 2: global.joy2 = joy_key; break;
            case 3: global.joy3 = joy_key; break;
            case 4: global.joy4 = joy_key; break;
            }
        mode += 1;
        timer = 0;
        joy_key = -1;
        }
    else if timer == 60 instance_destroy();
    }

