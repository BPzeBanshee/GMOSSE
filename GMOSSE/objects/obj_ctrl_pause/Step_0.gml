if !enabled then exit;

// *************** Input Checking ***************
// Resetting Hook
if !global.jup && !global.jdown 
&& !global.jleft && !global.jright
&& !global.button1 && !global.button2
&& !global.button3 && !global.button4
&& enabled
then hook = 0;

// Up
if (global.jup && !hook && enabled)
    {
    scr_playsnd(snd_click,1);
    hook = 1;
    selection -= 1; // Scroll up on the menu.
    if selection < 1 then selection = 5; // Goes to the bottom box.
    }

// Down
if (global.jdown && !hook && enabled)
    {
    scr_playsnd(snd_click,1);
    hook = 1;
    selection += 1; // Scroll down on the menu.
    if selection > 5 then selection = 1; // Goes to the top box.
    }

// Button 1
if (global.button1 && !global.levelend && !hook && enabled)
    {
    hook = 1;
    scr_playsnd(snd_click,1);
    switch selection 
        {
        case 1: // resume game
            {
            scr_pausemusic(0);
            scr_unpause();
            instance_destroy();
            break;
            }
        case 2: // restarting room
            {
            if restart_locked exit; // Do not allow restarts after stage 1
            scr_pausemusic(0);
            scr_stopallmusic();
            scr_trans(room,2,c_black,0.025,0.05,0);
            if global.nextroom == rm_stage1
                {
                global.score_stored = 0;
                global.extend_number = 1;
                global.lives_stored = 3;
                global.bombs_stored = global.init_bombs;
                global.chain = 0;
                global.countdown = 0;
                
                // TODO: Does obj_ctrl_game even get this command? does it care?
                with obj_ctrl_game
                    {
                    respawntimer = -1;
                    deathtimer = 0;
                    }
                }
            break;
            }
        case 3: // restarting and going to Ship Selection menu
            {
            scr_pausemusic(0);
            scr_stopallmusic();
            scr_trans(rm_shipselect,2,c_black,0.025,0.05,0);
            with obj_ctrl_music gameover = 1; // Free generic music
            break;
            }
        case 4: // going to Config menu
            {
            instance_create_depth(xview,yview,depth-1,obj_ctrl_config);
            enabled = 0;
            break;
            }
        case 5: // exiting to Main Menu
            {
            scr_pausemusic(0);
            scr_stopallmusic();
            scr_trans(rm_menu,2,c_white,0.025,0.05,0);
            with obj_ctrl_music gameover = 1; // Free generic music
            break;
            }
        }
    }

