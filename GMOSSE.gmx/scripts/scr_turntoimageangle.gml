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
**  renamed by BPzeBanshee to conform to standard
**  modified by BPzeBanshee to alter image_angle instead 
*/
{
    var wdir, tempdir, turnspeed;
    wdir = argument0;
    turnspeed = argument1;
    if (abs(wdir-image_angle) > 180) {
        if (wdir > 180) {
            tempdir = wdir - 360;
            if (abs(tempdir-image_angle) > turnspeed) {
                image_angle -= turnspeed;
            } else {
                image_angle = wdir;
            }
        } else {
            tempdir = wdir + 360;
            if (abs(tempdir-image_angle) > turnspeed) {
                image_angle += turnspeed;
            } else {
                image_angle = wdir;
            }
        }
    } else {
        if (abs(wdir - image_angle) > turnspeed) {
            if (wdir > image_angle) {
                image_angle += turnspeed;
            } else {
                image_angle -= turnspeed;
            }
        } else {
            image_angle = wdir;
        }
    }
}
