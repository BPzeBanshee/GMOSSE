/*
scr_stopmusic(), by BPzeBanshee

Usage: scr_stopmusic(argument0)
argument0 = the ID of the music playing

Note:
the argument0 > 0 check is specific to my
programming, not FMOD.
If you call FMODInstanceStop on the same
index twice you'll trigger an Invalid Handle
error, so best to avoid doing that here by
setting your variable to 0 after calling this.
*/
if argument0 > 0
    {
    if FMODInstanceIsPlaying(argument0) then FMODInstanceStop(argument0);
    }
