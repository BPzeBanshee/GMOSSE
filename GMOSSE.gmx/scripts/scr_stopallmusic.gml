/*
scr_stopallmusic, by BPzeBanshee

Usage: scr_stopallmusic()
Requirements: GMFMODSimple

Note:
Wording of instructional use on this is vague.
This doesn't "free" the music but makes them
free to BE removed from memory safely using
FMODSoundFree(). Think of Safely Removing 
a USB stick as opposed to just pulling it.
*/
FMODAllStop();
