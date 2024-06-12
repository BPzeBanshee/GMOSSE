/// @description  MENU BEHAVIOUR (PER MODE)
/// @param PER MODE
event_user(category);
enabled = true;

// Get inputs
var up = global.jup[0];
var down = global.jdown[0];
var left = global.jleft[0];
var right = global.jright[0];
var b1 = global.button1[0];

// UP
if up && !hook
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection -= 1;
    if selection < 1 then selection = selection_max;
    }
    
// DOWN
if down && !hook
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection += 1;
    if selection > selection_max then selection = 1;
    }

// HOOK
if !b1 && !up && !down && !left && !right then hook = false;

