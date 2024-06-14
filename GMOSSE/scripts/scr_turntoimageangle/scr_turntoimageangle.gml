function scr_turntoimageangle(angle,turnspeed) {
	/*
	**  Usage:
	**      scr_turntoangle(angle,turnspeed)
	**
	**  Arguments:
	**      angle       direciton you wish to achieve, degrees
	**      turnspeed       rate at which to turn, degrees
	**
	**  Returns:
	**      nothing, but rotates the calling instance toward
	**      a desired image_angle by a given number of degrees
	**
	**  GMLscripts.com
	**  modified by BPzeBanshee for consistency and to alter image_angle 
	*/
	var tempdir;
	if (abs(angle-image_angle) > 180) 
		{
		if (angle > 180) 
			{
		    tempdir = angle - 360;
		    if (abs(tempdir-image_angle) > turnspeed) 
			then image_angle -= turnspeed
			else image_angle = angle;
		    } 
		else 
			{
		    tempdir = angle + 360;
		    if (abs(tempdir-image_angle) > turnspeed)
		    image_angle += turnspeed
		    else image_angle = angle;
		    }
		} 
	else 
		{
	    if (abs(angle - image_angle) > turnspeed) 
			{
	        if (angle > image_angle)
	        image_angle += turnspeed
	        else image_angle -= turnspeed;
			} 
		else image_angle = angle;
		}
}