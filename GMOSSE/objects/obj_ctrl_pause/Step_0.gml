if !enabled exit;

// *************** Input Checking ***************
var up = global.jup[0];
var down = global.jdown[0];
var b1 = global.button1[0];

// Up
if (up && !hook && enabled)
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection -= 1; // Scroll up on the menu.
    if selection < 1 selection = 5; // Goes to the bottom box.
    }

// Down
if (down && !hook && enabled)
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection += 1; // Scroll down on the menu.
    if selection > 5 selection = 1; // Goes to the top box.
    }

// Button 1
if (b1 && !global.levelend && !hook && enabled)
    {
    hook = true;
    scr_snd_play(snd_click,true);
    switch selection 
        {
        case 1: // resume game
            {
            with obj_ctrl_music resume();
            scr_unpause();
            instance_destroy();
            break;
            }
        case 2: // restarting room
            {
            if restart_locked exit; // Do not allow restarts after stage 1
			with obj_ctrl_music
				{
				resume();
				stop_all();
				}
            scr_trans(room,2,c_black,0.025,0.05,0);
            if global.nextroom == rm_stage1
                {
				global.medalvalue = 1;
				for (var i=0;i<2;i++)
					{
					global.player_data[i].myscore = 0;
					global.player_data[i].mylives = 3;
					global.player_data[i].mybombs = -1;
					global.player_data[i].extends = 0;
					global.player_data[i].continues = 0;
					}
                
                // TODO: Does obj_ctrl_game even get this command? does it care?
                with obj_ctrl_game
                    {
                    respawntimer = -1;
                    deathtimer = 0;
					chain = 0;
					countdown = 0;
                    }
                }
            break;
            }
        case 3: // restarting and going to Ship Selection menu
            {
            with obj_ctrl_music
				{
				resume();
				stop_all();
				}
            scr_trans(rm_shipselect,2,c_black,0.025,0.05,0);
            break;
            }
        case 4: // going to Config menu
            {
            instance_create_depth(xview,yview,depth-1,obj_ctrl_config);
            enabled = false;
            break;
            }
        case 5: // exiting to Main Menu
            {
            with obj_ctrl_music
				{
				resume();
				stop_all();
				}
            scr_trans(rm_menu,2,c_white,0.025,0.05,0);
            break;
            }
        }
    }

// Resetting Hook
if !up && !down && !b1 && enabled
hook = false;