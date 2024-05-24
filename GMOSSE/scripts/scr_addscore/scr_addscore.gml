/*
scr_addscore() by BPzeBanshee

DO NOT CONFUSE WITH HIGH-SCORE SAVING
	
Examples:
scr_addscore(0,0,1); - adds nothing but multiplier
scr_addscore(500,0,0); - adds points but not multiplied
scr_addscore(500,180,1); - adds points and +1 to multiplier, fills the countdown meter
scr_addscore(0,5,0); - adds to countdown meter

If you're going to do things DDP-style,
you may to want to set multiplier to a non-zero value,
or comment it out from here and just call it on death 
of your enemy with whatever you passed into scr_addscore 
for points in the first place.
*/
/// @desc This is used by enemies who have just 'died' to add to the chain meter and grant points.
/// @param points
/// @param time
/// @param multiplier
function scr_addscore(points, time, multiplier) {
	var o = obj_ctrl_game;
	if time > 0
		{
		if (o.countdown + time) > 180
		then o.countdown = 180
		else o.countdown += time;
		}
	if multiplier > 0 // if a multiplier is given
	    {
	    o.chain += multiplier;
	    if points > 0 then o.myscore += points * o.chain;
	    }
	else // no multiplier given, just add score
	    {
	    if points > 0 then o.myscore += points;
	    }
}