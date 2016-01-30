/*
scr_pausemusic, by BPzeBanshee

Usage: scr_pausemusic(off/on)
Requirements:
- using GMFMODSimple, duh
- having something useful for groups 1/3
(group 1 in GMOSSE is music,
group 3 was the sfx that haven't been
brought over to GM Sound Engine yet)
*/
if argument0=1
then AStreamPause(music)
else AStreamResume(music);
//FMODInstanceSetPaused(music,argument0);
//FMODGroupSetPaused(1,argument0);
