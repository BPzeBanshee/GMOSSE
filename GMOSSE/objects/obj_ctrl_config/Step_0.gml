/// @description  MENU BEHAVIOUR (PER MODE)
/// @param PER MODE
event_user(category);
enabled = true;

// UP
if global.jup && !hook
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection -= 1;
    if selection < 1 then selection = selection_max;
    }
    
// DOWN
if global.jdown && !hook
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection += 1;
    if selection > selection_max then selection = 1;
    }

// HOOK
if !global.button1 && !global.jup && !global.jdown
&& !global.jleft && !global.jright then hook = 0;

