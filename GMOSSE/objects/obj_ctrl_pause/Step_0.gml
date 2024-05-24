if !enabled then exit;

// *************** Input Checking ***************

// Up
if (global.jup && !hook && enabled)
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection -= 1; // Scroll up on the menu.
    if selection < 1 then selection = 5; // Goes to the bottom box.
    }

// Down
if (global.jdown && !hook && enabled)
    {
    scr_snd_play(snd_click,true);
    hook = true;
    selection += 1; // Scroll down on the menu.
    if selection > 5 then selection = 1; // Goes to the top box.
    }

// Button 1
if (global.button1 && !global.levelend && !hook && enabled)
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
            if restart_locked then exit; // Do not allow restarts after stage 1
			with obj_ctrl_music
				{
				resume();
				stop_all();
				}
            scr_trans(room,2,c_black,0.025,0.05,0);
            if global.nextroom == rm_stage1
                {
				for (var i=0;i<2;i++)
					{
					global.score_stored[i] = 0;
					global.lives_stored[i] = 3;
					global.bombs_stored[i] = -1;
					global.extend_number[i] = 1;
					global.continues[i] = 0;
					global.medalvalue[i] = 1;
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
if !global.jup && !global.jdown 
&& !global.jleft && !global.jright
&& !global.button1 && !global.button2
&& !global.button3 && !global.button4
&& enabled
then hook = false;