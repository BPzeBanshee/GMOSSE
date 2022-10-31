function scr_turntoangle(argument0, argument1) {
	/*
	Usage: scr_turntoangle(direction,turnspeed)
	Arguments:
	direction       direciton you wish to achieve, degrees
	turnspeed       rate at which to turn, degrees

	Returns:
	nothing, but rotates the calling instance toward
	a desired direction by a given number of degrees

	GMLscripts.com
	renamed by BPzeBanshee to conform to standard
	*/
	var wdir, tempdir, turnspeed;
	wdir = argument0;
	turnspeed = argument1;
	if (abs(wdir-direction) > 180) 
	    {
	    if (wdir > 180) 
	        {
	        tempdir = wdir - 360;
	        if (abs(tempdir-direction) > turnspeed) 
	            {
	            direction -= turnspeed;
	            } 
	        else direction = wdir;
	        } 
	    else 
	        {
	        tempdir = wdir + 360;
	        if (abs(tempdir-direction) > turnspeed) 
	            {
	            direction += turnspeed;
	            } 
	        else direction = wdir;
	        }
	    } 
	else 
	    {
	    if (abs(wdir - direction) > turnspeed) 
	        {
	        if (wdir > direction) 
	            {
	            direction += turnspeed;
	            } 
	        else direction -= turnspeed;
	        } 
	    else direction = wdir;
	    }



}
