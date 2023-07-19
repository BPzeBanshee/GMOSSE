/* SCROLLING MESSAGE */
chr1 += 1;
text = string_copy(msg,1,chr1);

/* BUTTON EVENTS */
// Up
if (global.jup && selection > 1 && !hook)
    {
    selection -= 1;
    chr1 = 0;
    hook = 1;
    event_user(menu);
    }

// Down
if (global.jdown && selection < 7 && !hook)
    {
    selection += 1;
    chr1 = 0;
    hook = 1;
    event_user(menu);
    }

// Button 1
if (global.button1 && !hook)
    {
    hook = 1;
    switch menu
        {
        case 1:
            {
            chr1 = 0;
            global.optiontype = selection;
            selection = 1;
            menu = 2;
            event_user(menu);
            break;
            }
        case 2:
            {
            chr1 = 666;
            global.weapontype = selection;
            // go to playing room (using transition object)
            scr_trans(global.startstage,3,c_black,0.025,0.05,210);
            with obj_ctrl_music fade_out(0.0055);
            break;
            }
        }
    }
    
// Hook Reset
if !global.button1
&& !global.jup 
&& !global.jdown
&& !instance_exists(obj_trans)
then hook = 0;