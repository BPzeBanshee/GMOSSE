// Movement handling
timer += 1;
if timer > 30 then direction -= 10;
if timer == 30
    {
    speed = 10;
    direction = 270;
    }
    
// Handling is now done via obj_boss, it changes obj_orb's mode value
if phase > 0 then event_user(phase);