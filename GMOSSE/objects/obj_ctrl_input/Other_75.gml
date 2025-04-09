/// @desc Controller Hotplug Support
/*
System Event

Portions of this code taken from YoYoGames' Twin Stick Shooter example code
modified to work with GMOSSE by BPzeBanshee
*/

// Precaution to preserve joystick/gamepad state if disabled
if !enabled exit;

// Additional precaution to stop crash if async_load is invalid
var event = async_load[? "event_type"];
if is_undefined(event) exit;

// Debug code so you can see which event has been triggered
trace("Event: " + event);

// Parse the async_load map to see which event has been triggered
switch(event) 
    {
    case "gamepad discovered": 
        {
        // Get the pad index value from the async_load map
        var pad = async_load[? "pad_index"];
        trace("Pad ID: " + string(pad));
		
		// If it's the config-preferred, just pick it
		if global.joy_pref == pad
            {
            global.joy_id = pad;
            trace("Pad set to preferred ID "+string(pad)+" ("+string(gamepad_get_description(pad))+")");
            }
		else find_new_pad();
        
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
        if pad == global.joy_id find_new_pad();
        break;
        }
    }