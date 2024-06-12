/// @desc Controller Hotplug Support
/*
System Event

Portions of this code taken from YoYoGames' Twin Stick Shooter example code
modified to work with GMOSSE by BPzeBanshee
*/

// Precaution to preserve joystick/gamepad state if disabled
if !enabled then exit;
var jid = 0;

// Debug code so you can see which event has been triggered
trace("Event: " + async_load[? "event_type"]);        

// Parse the async_load map to see which event has been triggered
switch(async_load[? "event_type"]) 
    {
    case "gamepad discovered": 
        {
        // Get the pad index value from the async_load map
        var pad = async_load[? "pad_index"];
        trace("Pad ID: " + string(pad));
        
        // If multiple pads are connected, pick the preferred one defined via config
        if gamepad_get_device_count() > 1
            {
            if global.joy_pref == pad
                {
                global.joy_id[jid] = pad;
                trace("Pad set to preferred ID "+string(pad)+" ("+string(gamepad_get_description(pad))+")");
                }
            }
        else 
            {
            global.joy_id[jid] = pad; // otherwise if it's the only pad, use it
            trace("Pad set to only available ID "+string(pad)+" ("+string(gamepad_get_description(pad))+")");
            }
        
        // Set the deadzone for the analog stick and triggers
        //gamepad_set_axis_deadzone(pad,global.deadzone); // not needed, done manually
        
        // used for certain triggers like DualShock4 L2/R2, needs alt variable of some kind
        //gamepad_set_button_threshold(pad,global.deadzone); 
        break;
        }
    case "gamepad lost":
        {
        // Get the pad index
        var pad = async_load[? "pad_index"];
        trace("Pad ID: " + string(pad));
        
        // If lost pad is currently used/preferred, find us a new one!
        if global.joy_id[jid] == pad
            {
            global.joy_id[jid] = -1; // Nuke old ID
            
            var count = 0; 
            pad = 0; 

            // Try to find and pick the first available gamepad
            while pad < gamepad_get_device_count()
                {
                if gamepad_is_connected(pad) 
                    {
                    if global.joy_id[jid] == -1 then global.joy_id[jid] = pad;
                    count += 1;
                    }
                pad += 1;
                }
                
            // Report result to console
            if pad == gamepad_get_device_count() && global.joy_id[jid] == -1
            then trace("Failed to find any joystick/gamepads")
            else trace(string(count)+" Pads found, picked ID: "+string(global.joy_id[jid]));
            }
        break;
        }
    }