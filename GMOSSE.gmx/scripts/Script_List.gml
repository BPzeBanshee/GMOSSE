/*
This is a simple list of all of the scripts in GMOSSE and a brief description of what they do.
Sorted by the in-gmk folder structure.

TODO: Update this with newest scripts


CORE
    >
        Config
            * scr_config_load()
            - Loads the player-configured controls, screen options,
            sound options, and the font type.
            * scr_config_save()
            - Saves the player-configured controls, screen options,
            sound options, and the font type.
        >
    DLLs
        GMALP
            Documentation TBA
        >
    >
        
        Music
            * scr_loadmusic(sectionofini, groupnumber)
                - Makes use of GMALP to load a music file.
            * scr_loadmusicinfo(inilocation, sectionofini)
                - Loads an ini file containing all of the music information.
            * scr_stopallmusic()
                - Stops all the music currently being played by GMALP.
            * scr_freemusic(file)
                - Frees given music from memory.
            * scr_freeallmusic()
                - Frees all the music currently being played by GMALP.    
            * scr_pausemusic(num)
                - Pauses the music if set to 1, unpauses if 0.
            * scr_setvolmusic(volume)
                - Sets the volume to be used by GMALP. Range from 0 to 1.
            * scr_fademusic(musictofade,amount)
                - Creates obj_fade, which fades out the music.
            * scr_playmusic(music)
                - Plays given music.
            * scr_pickmusicini()
                - Opens a dialog box where you can pick a music INI file.
        >
        Sounds
            * scr_playsnd(sound,stop)
                - Plays sound. "stop" indicates whether to stop any previous
                  iterations of sound before playing it again.
            * scr_loopsnd(sound,stop)
                - Same as scr_playsnd, but makes a looping sound instead.
            * scr_setvolsnd(vol)
                - Sets the volume for all individual sound effects.
            * scr_stopsnd(snd)
                - Stops given sound.

        >
        Pause
            * scr_pause()
                - Pauses the game
            * scr_unpause()
                - Unpauses the game
            * scr_pause_draw()
                - Draws the screen following use of scr_pause.
        >
        High Score
            * scr_encrypt()
                - Encryption script. The scripts that need this call this anyway.
                  Best not to touch this script.
            * scr_decrypt()
                - Decryption script. The scripts that need this call this anyway.
                  Best not to touch this script.
            * scr_hiscore_load(file)
                - Either initializes the score file (if it does not exist)
                  or retrieves high scores from it.
            * scr_hiscore_save(file)
                - Writes the high scores to a file.
            * scr_hiscore_update(score,name,position)
                - Adds a new score to the current array of high scores.
            * scr_hiscore_reset()
                - This just simply resets all highscore variables.
            * scr_hiscore_draw()
                - Used by obj_ctrl_scoreboard, this draws the highscore table.
        >
        Screen
            * scr_screen_init()
                - Sets up the screen based on the results of scr_loadconfig().
            * scr_scanline(mode)
                - Draws scanlines to the screen.
            * scr_setdisplay(aa,vsync)
                - Sets antialiasing and vsync options. 0-3 for AA, 0-1 for vsync.
            * scr_max_aa()
                - Returns the maximum AA value from 0-3, used in scr_setdisplay()
                and in obj_ctrl_config when managing AA values.
            * scr_fullscreen(full)
                - Sets fullscreen or windowed mode. Also turns off cursor and
                triggers refresh of the filter mode as needed.
        >
        Fonts
            * scr_fonts_init()
                - Creates fonts from sprites.
            * scr_fonts_set()
                - Replaces fonts from sprites if alternate font is selected.
        >
        Camera
            * scr_camera_init(left_bound,right_bound,xspd,yspd)
                - Creates obj_ctrl_camera instance and initialises bounds.
                See obj_ctrl_st2 for example usage.
            * scr_camera_spd(xspd,yspd)
                - Updates obj_ctrl_camera to scroll around the room at a certain
                speed. 
            * scr_camera_bound(left_bound,right_bound)
                - Updates obj_ctrl_camera's maximum left and right screen boundaries.
        >
        Others
            * scr_3D()
                - Macro script for fake 3D visual effects (see the enemies that use it).
            * scr_trans(room,mode,sprite/color,animspeed,delayatend)
                - Transitions to a new room with the given transition properties.
            * scr_checkstages()
                - Determines what number to display when saying "STAGE (x) START".
            * scr_draw_vars(font,align,color)
                - Macro function for text drawing purposes.
            * scr_draw_gauge(x1,y1,r,width,start,end,dir,value,mincol,maxcol)
                - Draws a healthbar-like gauge with the given properties, centered at x1,y1.
            * scr_create_healthbar()
                - Creates an object that draws a healthbar for a boss enemy.
            * scr_addscore(score,time,multiplier)
                - Adds amount to the current score value.
        * scr_input()
            - Processes player input.
        * scr_detect_joys()
            - Detects usable joystick ID to use, see script for more info.
        * scr_main_init()
            - Responsible for all game-start operations, including DLL loading.
        * scr_main_reset()
            - Undoes the things done by scr_main_init().
    >
    Player
        * scr_getshipinfo()
            - Gets the information of the ship selected by the player.
        * scr_hud_p1()
            - Draws the HUD for the first player. Used by obj_ctrl_game.
    >
    Bullets
        >
        S20-TBL's Scripts
            * scr_circleshot02(density,x,y,distance,bullettype,speed,imageaim)
                - Creates a circle of  aimed bullets.
            * scr_circleattack(density,x,y,distance,bullettype,target,speed,imageaim)
                - Creates a circle of bullets.
            >
        * scr_basicshot(x,y,bullettype,speed,direction)
            - Shoots a bullet.
        * scr_spreadshot(x,y,bullettype,sound,arc,numbullets,speed)
            - Shoots an arc of bullets.
        * scr_spreadshot_aim(x,y,bullettype,sound,arc,numbullets,speed,imagedir,shootdir)
            - Same as above but accepts a given base direction to shoot at.    
        * scr_turntoangle(direction,turnspeed)
            - Gradually turns move direction of calling object toward direction.
        * scr_turntoimageangle(angle, turnspeed)
            - Gradually rotates image of calling object toward direction.
        * scr_clearbullets()
            - Clears all bullets from the screen.
    >
    Others
        * scr_create_exp(object,amount,countup)
            - Creates an enemy explosion.
        * scr_draw_input()
            - Displays player input. Use for debugging only.
        * scr_isonscreen()
            - Called by an object to see if its x/y position is within the view.
        * string_spacefix()
            - Use this with strings that use enter key presses for paragraphing
            to allow GM to draw it properly instead of spacing it twice.
*/
