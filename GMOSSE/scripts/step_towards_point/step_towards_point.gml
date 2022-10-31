/// @func step_towards_point(xgoal,ygoal,stepsize)
/// @desc increments the player's position towards a given x/y co-ordinate
/// @param {Real} xgoal
/// @param {Real} ygoal
/// @param {Real} stepsize
function step_towards_point(xgoal,ygoal,stepsize){
	var dir = point_direction(x,y,xgoal,ygoal);
	var dist = point_distance(x,y,xgoal,ygoal);
	if dist < stepsize then stepsize = dist;
	x = x + lengthdir_x(stepsize,dir);
	y = y + lengthdir_y(stepsize,dir);
	return 0;
}