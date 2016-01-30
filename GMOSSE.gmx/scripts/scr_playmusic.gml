/* 
scr_playmusic(), by BPzeBanshee

Usage: scr_playmusic(argument0,argument1)
argument0 = the file to play
argument1 = looping (0 does not loop)
*/
if argument0 = -1 then exit;
e = AStreamPlay(argument0,1);
AStreamSetRepeat(e,argument1);
return e;
