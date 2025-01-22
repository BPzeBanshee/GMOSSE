/// @description  MENU BEHAVIOUR (PER MODE)
/// @param PER MODE
event_user(category);
enabled = true;

// Get inputs
var up = global.jup;
var down = global.jdown;
var left = global.jleft;
var right = global.jright;
var b1 = global.button1;

// UP
if up && !hook
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection -= 1;
    if selection < 1 selection = selection_max;
    }
    
// DOWN
if down && !hook
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection += 1;
    if selection > selection_max selection = 1;
    }

// HOOK
if !b1 && !up && !down && !left && !right hook = false;

