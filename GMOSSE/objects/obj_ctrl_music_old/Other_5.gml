// Stop the currently playing track
if room != rm_scores && global.nextroom != rm_scores
    {
    scr_stopallmusic();
    music = -1;
    }

// Stage-specific music to free
if room == rm_stage1
    {
    scr_freemusic(snd_st1); snd_st1 = -1;
    scr_freemusic(snd_omake1); snd_omake1 = -1;
    }
if room == rm_stage2
    {
    scr_freemusic(snd_st2); snd_st2 = -1;
    scr_freemusic(snd_omake2); snd_omake2 = -1;
    }
if room == rm_stage3
    {
    scr_freemusic(snd_st3); snd_st3 = -1;
    scr_freemusic(snd_st3b); snd_st3b = -1;
    scr_freemusic(snd_omake3); snd_omake3 = -1;
    }
    
    
// Music to load/music info to show in certain rooms

if global.nextroom == rm_menu
    {
    // Freeing generic sounds
    if gameover == 1 // rm_scores after game over, leaving to menu from pause menu
        {
        scr_freemusic(snd_boss); snd_boss = -1;
        scr_freemusic(snd_stageclear); snd_stageclear = -1;
        scr_freemusic(snd_continue); snd_continue = -1;
        scr_freemusic(snd_gameover); snd_gameover = -1;
        gameover = 0;
        }
        
    // Loading intro music
    if mainmenu == 0 // first start of GMOSSE
        {
        snd_intro = scr_loadmusic("Intro");
        info = scr_loadmusicinfo("Intro");
        }
    }    
    
if global.nextroom == rm_shipselect
    {
    // Freeing intro if loaded
    if mainmenu == 1
        {
        scr_freemusic(snd_intro); snd_intro = -1;
        mainmenu = 2; // set to 0 if you want intro to be loaded/played again on return
        }
        
    // Loading ship select music
    snd_shipselect = scr_loadmusic("Selection");
    info = scr_loadmusicinfo("Selection");
    }
    
if room == rm_shipselect
    {
    // Freeing ship select music when leaving the room
    scr_freemusic(snd_shipselect); snd_shipselect = -1;
    }
    
// Loading generic music
if global.nextroom > rm_tutorial
    {
    snd_boss = scr_loadmusic("Boss1");
    snd_stageclear = scr_loadmusic("StageComplete");
    snd_continue = scr_loadmusic("Continue");
    snd_gameover = scr_loadmusic("GameOver");
    }
    
// Stage specific music to load
if global.nextroom == rm_stage1 || global.nextroom == rm_boss1
    {
    snd_st1 = scr_loadmusic("Stage1");
    info = scr_loadmusicinfo("Stage1");
    snd_omake1 = scr_loadmusic("Omake1");
    }
        
if global.nextroom == rm_stage2 || global.nextroom == rm_boss2
    {
    snd_st2 = scr_loadmusic("Stage2");
    info = scr_loadmusicinfo("Stage2");
    snd_omake2 = scr_loadmusic("Omake2");
    }
    
if global.nextroom == rm_stage3
    {
    snd_st3 = scr_loadmusic("Stage3");
    info = scr_loadmusicinfo("Stage3");
    snd_st3b = scr_loadmusic("Stage3_B");
    snd_omake3 = scr_loadmusic("Omake3");
    }
    
if global.nextroom == rm_omake1
    {
    snd_omake1 = scr_loadmusic("Omake1");
    info = scr_loadmusicinfo("Omake1");
    }
    
if global.nextroom == rm_omake2 || global.nextroom == rm_test2
    {
    snd_omake2 = scr_loadmusic("Omake2");
    info = scr_loadmusicinfo("Omake2");
    }
    
if global.nextroom == rm_omake3 || global.nextroom == rm_test1
    {
    snd_omake3 = scr_loadmusic("Omake3");
    info = scr_loadmusicinfo("Omake3");
    }
    
scr_setvolsnd();    