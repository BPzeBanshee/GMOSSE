///scr_addscore(score,time,multiplier)
/*
scr_addscore() by BPzeBanshee

DO NOT CONFUSE WITH HIGH-SCORE SAVING
This is used by enemies who have just
'died' to add to the chain meter and
grant score.

Examples:
scr_addscore(0,0,1); - adds nothing but multiplier
scr_addscore(500,0,0); - adds score but not multiplied
scr_addscore(500,180,1); - adds score and +1 to multiplier, fills the countdown meter
scr_addscore(0,5,0); - adds to countdown meter

If you're going to do things DDP-style,
you may to want to set argument3 to a non-zero value,
or comment it out from here and just call it on death 
of your enemy with whatever you passed into scr_addscore 
for points in the first place.
*/

if argument2 != 0 // if a multiplier is given
    {
    global.chain += argument2;
    if argument0 > 0 then global.myscore += argument0 * global.chain;
    global.countdown += argument1;
    }
else // no multiplier given, just add score
    {
    if argument0 > 0 then global.myscore += argument0;
    }
