/// @description  MISC. SETTINGS MENU

// BEHAVIOUR
category_type = "MISC. SETTINGS";
selection_max = 7; // amount of positions in the submenu
max_h = 30;
if timer > 0 then timer -= 1;

// LEFT
if global.jleft && !hook
    {
    hook = 1;
    switch selection
        {
        case 1: global.debug = 0; break;
        case 2: global.hitbox_visible = 0; break;
        case 3: global.fonttype = 0; scr_fonts_set(); break;
        case 4: if global.bulletcolour > 1 then global.bulletcolour -= 1;  break;
        case 5: global.flicker = 0; break;
        }
    }
    
// RIGHT
if global.jright && !hook
    {
    hook = 1;
    switch selection
        {
        case 1: global.debug = 1; break;
        case 2: global.hitbox_visible = 1; break;
        case 3: global.fonttype = 1; scr_fonts_set(); break;
        case 4: if global.bulletcolour < 3 then global.bulletcolour += 1;  break;
        case 5: global.flicker = 1; break;
        }
    }
    
// BUTTON 1
if global.button1 && !hook 
    {
    hook = 1;
    scr_playsnd(snd_click,1);
    switch selection
        {
        case 6:
            {
            timer = 90;
            scr_hiscore_reset();
            scr_hiscore_save("score.gmes");
            break;
            }
        case 7:
            {
            timer = 0;
            selection = 1; 
            category = 0;
            break;
            }
        }
    }

