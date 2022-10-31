timer = 0;
alpha = 0;

// MAIN MENU
if room == rm_menu
    {
    timer = 360;
    if mainmenu == 0
        {
        music = scr_playmusic(snd_intro,0);
        mainmenu = 1;
        }
    }

// SHIP SELECT MENU
if room == rm_shipselect then music = scr_playmusic(snd_shipselect,1);

// STAGE 1
if room == rm_stage1 || room == rm_boss1 then music = scr_playmusic(snd_st1,1);
    
// STAGE 2
if room == rm_stage2 || room == rm_boss2 then music = scr_playmusic(snd_st2,1);
    
// STAGE 3
if room == rm_stage3 then music = scr_playmusic(snd_st3,1);
    
// TEST ROOM STAGES
if room == rm_test1 || room == rm_test2 
|| room == rm_omake1 || room == rm_omake2 
|| room == rm_omake3 || room == rm_tutorial
    {
    scr_stopallmusic();
    timer = 360;
    }
scr_setvolmusic(music);