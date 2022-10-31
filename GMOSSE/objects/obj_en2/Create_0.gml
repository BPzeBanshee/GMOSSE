// This initialises the variable 'timer' which is used and manipulated
// in the Step event of this object.

// If you set the option 'Treat uninitialised variables as value 0' in
// Global Game Settings you do not need to do this, but for good GML
// standards it is required, that way you are avoiding potential
// errors when dealing with complex arrays and stuff like that later
// down the track.

timer = 0;
enemyHP = 50;
event_inherited();

