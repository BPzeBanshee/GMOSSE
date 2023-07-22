/// @description  FILTER OPTIONS MENU

// BEHAVIOUR
category_type = "DISPLAY FILTERS";//"[FILTERS]";
selection_max = 5; // amount of positions in the submenu
max_h = 0;

// LEFT
if global.jleft && !hook
    {
    hook = true;
    switch selection
        {
        case 1: if global.wallbrightness > 5 then global.wallbrightness -= 5; break;
        case 2: global.filter = false; break;
        case 3: global.scanlines -= 1; if global.scanlines < 0 then global.scanlines = 2; break;
        case 4: if global.scanline_alpha > 5 then global.scanline_alpha -= 5; break;
        }
    }
    
// RIGHT
if global.jright && !hook
    {
    hook = 1;
    switch selection
        {
        case 1: if global.wallbrightness < 100 then global.wallbrightness += 5; break;
        case 2: global.filter = true; break;
        case 3: global.scanlines += 1; if global.scanlines > 2 then global.scanlines = 0; break;
        case 4: if global.scanline_alpha < 100 then global.scanline_alpha += 5; break;
        }
    }
    
// BUTTON 1
if global.button1 && !hook 
    {
    hook = true;
    scr_snd_play(snd_click,true);
    if selection == selection_max
        {
        max_h = 0;
        selection = 1; 
        category = 2;
        }
    }

