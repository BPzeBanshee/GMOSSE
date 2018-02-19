///scr_stopmusic(id)
/*
scr_stopmusic(), by BPzeBanshee
*/
if argument0 > -1
    {
    if AStreamIsPlaying(argument0) then AStreamStop(argument0);
    }
