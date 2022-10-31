/// @description  OMAKE BOSS THEME 2
timer = 0;
alpha = 0;
scr_stopmusic(music);

// Fun fact: this one actually came first, I just named it omake2 to fit with stage order
info = scr_loadmusicinfo("Omake2");
music = scr_playmusic(snd_omake2,1);
scr_setvolmusic(music);