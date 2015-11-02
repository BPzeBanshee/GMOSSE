/* Frees the music from memory */
// Common music (ie. boss theme, stage clear)
scr_freemusic(global.snd_stageclear);
scr_freemusic(global.snd_gameover);
scr_freemusic(global.snd_boss);

// Intro (if it's loaded in the first place)
if global.introloaded = 1
    {
    scr_freemusic(global.snd_intro); 
    global.introloaded = 0;
    }

// Ship Selection theme (if it's loaded in the first place)
if room = rm_menu then scr_freemusic(global.snd_shipselect);

// Stage-specific music
if global.level = real(1)
    {
    scr_freemusic(global.snd_st1);
    scr_freemusic(global.snd_omake1);
    }
if global.level = real(2)
    {
    scr_freemusic(global.snd_st2);
    scr_freemusic(global.snd_omake2);
    }
if global.level = real(3)
    {
    scr_freemusic(global.snd_st3);
    scr_freemusic(global.snd_omake3);
    }
if global.level = 6662 then scr_freemusic(global.snd_omake2);
