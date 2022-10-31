/// @description  CONTROL OPTIONS MENU

// BEHAVIOUR
category_type = "CONTROLS SETTINGS";
selection_max = 5; // amount of positions in the submenu
max_h = 0;

// LEFT
if global.jleft && !hook
    {
    hook = 1;
    switch selection
        {
        case 3: if global.deadzone > 0.1 then global.deadzone -= 0.1; break;
        case 4: if global.joytype > 0 then global.joytype -= 1; break;
        }
    }

// RIGHT
if global.jright && !hook
    {
    hook = 1;
    switch selection
        {
        case 3: if global.deadzone < 1 then global.deadzone += 0.1; break;
        case 4: if global.joytype < 2 then global.joytype += 1; break;
        }
    }
    
if global.button1 && !hook 
    {
    scr_playsnd(snd_click,1);
    hook = 1;
	var c;
    switch selection
        {
        case 1: c = instance_create_depth(x,y,depth-1,obj_ctrl_rebind); c.control = 1; break;
        case 2: c = instance_create_depth(x,y,depth-1,obj_ctrl_rebind); c.control = 2; break;
        case 5: selection = 1; category = 0; break;
        }
    }

