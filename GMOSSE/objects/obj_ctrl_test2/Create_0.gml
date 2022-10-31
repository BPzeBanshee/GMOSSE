/*
TEST 2: Omnidirectional scrolling

This was quite some feat under obj_ctrl_screen
but is made very simple with obj_ctrl_camera as
the code is the same as for y values - as it should.
Very successful results. 

Will use for stage 4. Inspiration/example here:
https://www.youtube.com/watch?v=LHoxjcpgB4Y

Also used with working wobblescroll in all of the
Raiden Fighters games.

TODO: 
Do a better way of direction-to-speed conversion
(for easier coding of direction/speed changes)

Look into deactivation of enemies outside the view
- should we do this via the controller as we've been
doing or in obj_en_parent's End Step?
*/

direction = 90;
stage_time = 0;
global.level = 4; 
global.pausable = true;
global.behaviour = 4; // determines behaviour of stars (if used)
scr_camera_init(0,80,0,-0.33);
instance_create_layer(x+160,y+240,layer,obj_ctrl_game);

/*
instance_deactivate_object(obj_en_wall);
instance_deactivate_object(obj_en_parent);
*/