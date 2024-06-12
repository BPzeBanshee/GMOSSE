/// @description  MAIN OPTIONS MENU
category_type = "CONFIGURATION MENU";
selection_max = 5;
max_h = 0;

if global.button1[0] && !hook 
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection_previous = selection;
    switch selection
        {
        case 1: selection = 1; category = 1; break;
        case 2: selection = 1; category = 2; break;
        case 3: selection = 1; category = 4; break;
        case 4: selection = 1; category = 5; break;
        case 5: instance_destroy(); break;
        }
    }

