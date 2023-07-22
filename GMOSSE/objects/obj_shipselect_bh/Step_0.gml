/* SCROLLING MESSAGE */
chr1 += 1;
text = string_copy(msg,1,chr1);

/* BUTTON EVENTS */
// Up
if (global.jleft && selection > 1 && !hook)
    {
    selection -= 1;
    chr1 = 0;
    event_user(0);
	if menu == 2 then update_weapon(selection);
    }

// Down
if (global.jright && selection < 7 && !hook)
    {
    selection += 1;
    chr1 = 0;
    event_user(0);
	if menu == 2 then update_weapon(selection);
    }

// Button 1
if (global.button1 && !hook)
    {
    switch menu
        {
        case 1:
            {
            // Set option type, recall weapon type from previous runs
            global.optiontype = selection;
            selection = global.weapontype;
			chr1 = 0;
            menu = 2;
            event_user(0);
            break;
            }
        case 2:
            {
			// Set weapon type, start game!
            chr1 = 666;
            global.weapontype = selection;
            // go to playing room (using transition object)
            scr_trans(global.startstage,3,c_black,0.025,0.05,210);
            with obj_ctrl_music fade_out(0.0055);
            break;
            }
        }
    }
	
// Button 2
if (global.button2 && !hook)
	{
	switch menu
		{
		case 1:
			{
			global.optiontype = selection;
			
			// Go back to ship selection
			instance_create_layer(x,y,layer,obj_shipselect);
			instance_destroy();
			break;
			}
		case 2:
			{
			// Go back to option selection, recall said selection
			global.weapontype = selection;
			selection = global.optiontype;
			menu = 1;
			chr1 = 0;
			event_user(0);
			break;
			}
		}
	}
    
// hook handling (so you don't select anything twice)
if (global.button1) 
|| (global.button2) 
|| (global.jleft) 
|| (global.jright) then hook = true;

if !(global.button1) 
&& !(global.button2) 
&& !(global.jleft) 
&& !(global.jright)
&& !instance_exists(obj_trans) then hook = false;