// GET INPUTS
var left = global.jleft[0];
var right = global.jright[0];
var button1 = global.button1[0];
var button2 = global.button2[0];

// SCROLLING MESSAGE
chr1 += 1;
text = string_copy(msg,1,chr1);

// BUTTON EVENTS
// Left
if (left && selection > 1 && !hook)
    {
    selection -= 1;
    chr1 = 0;
    event_user(0);
	if menu == 2 update_weapon(selection);
    }

// Right
if (right && selection < 7 && !hook)
    {
    selection += 1;
    chr1 = 0;
    event_user(0);
	if menu == 2 update_weapon(selection);
    }

// Button 1
if (button1 && !hook)
    {
    switch menu
        {
        case 1:
            {
            // Set option type, recall weapon type from previous runs
            global.player_data[0].optiontype = selection;
            selection = global.player_data[0].weapontype;
			chr1 = 0;
            menu = 2;
            event_user(0);
            break;
            }
        case 2:
            {
			// Set weapon type, start game!
            chr1 = 666;
            global.player_data[0].weapontype = selection;
            // go to playing room (using transition object)
            scr_trans(global.startstage,3,c_black,0.025,0.05,210);
            with obj_ctrl_music fade_out(3000);
            break;
            }
        }
    }
	
// Button 2
if (button2 && !hook)
	{
	switch menu
		{
		case 1:
			{
			global.player_data[0].optiontype = selection;
			
			// Go back to ship selection
			instance_create_layer(x,y,layer,obj_shipselect);
			instance_destroy();
			break;
			}
		case 2:
			{
			// Go back to option selection, recall said selection
			global.player_data[0].weapontype = selection;
			selection = global.player_data[0].optiontype;
			menu = 1;
			chr1 = 0;
			event_user(0);
			break;
			}
		}
	}
    
// hook handling (so you don't select anything twice)
if (button1) 
|| (button2) 
|| (left) 
|| (right) hook = true;

if !(global.button1) 
&& !(global.button2) 
&& !(global.jleft) 
&& !(global.jright)
&& !instance_exists(obj_trans) hook = false;