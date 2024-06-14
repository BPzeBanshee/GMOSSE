/// @description  CONTROL OPTIONS MENU

// BEHAVIOUR
category_type = "CONTROLS SETTINGS";
selection_max = 5; // amount of positions in the submenu
max_h = 0;

// LEFT
if global.jleft[0] && !hook
    {
    hook = true;
    switch selection
        {
        case 3: if global.deadzone > 0.1 global.deadzone -= 0.1; break;
        case 4: if global.joytype > 0 global.joytype -= 1; break;
        }
    }

// RIGHT
if global.jright[0] && !hook
    {
    hook = true;
    switch selection
        {
        case 3: if global.deadzone < 1 global.deadzone += 0.1; break;
        case 4: if global.joytype < 2 global.joytype += 1; break;
        }
    }
    
if global.button1[0] && !hook 
    {
    scr_snd_play(snd_click,true);
    hook = true;
	var c;
    switch selection
        {
        case 1: c = instance_create_depth(x,y,depth-1,obj_ctrl_rebind); c.control = 1; break;
        case 2: c = instance_create_depth(x,y,depth-1,obj_ctrl_rebind); c.control = 2; break;
        case 5: selection = selection_previous; category = 0; break;
        }
    }

