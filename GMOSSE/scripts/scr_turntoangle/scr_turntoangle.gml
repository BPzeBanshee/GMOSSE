function scr_turntoangle(angle, turnspeed) {
	/*
	Usage: scr_turntoangle(direction,turnspeed)
	Arguments:
	direction       direciton you wish to achieve, degrees
	turnspeed       rate at which to turn, degrees

	Returns:
	nothing, but rotates the calling instance toward
	a desired direction by a given number of degrees

	GMLscripts.com
	modified by BPzeBanshee to conform to standard
	*/
	var tempdir;
	if (abs(angle-direction) > 180) 
	    {
	    if (angle > 180) 
	        {
	        tempdir = angle - 360;
	        if (abs(tempdir-direction) > turnspeed) 
	        then direction -= turnspeed
	        else direction = angle;
	        } 
	    else 
	        {
	        tempdir = angle + 360;
	        if (abs(tempdir-direction) > turnspeed) 
	        then direction += turnspeed
	        else direction = angle;
	        }
	    } 
	else 
	    {
	    if (abs(angle - direction) > turnspeed) 
	        {
	        if (angle > direction) 
	        then direction += turnspeed
	        else direction -= turnspeed;
	        } 
	    else direction = angle;
	    }
}