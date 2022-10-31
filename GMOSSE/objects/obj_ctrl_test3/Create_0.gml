/*
TEST 3: DYNAMICALLY ALTERING WOBBLE SCROLL VALUE
Useful for alternate stage segments depending
on player travel.
Example game: https://youtu.be/VBCgCGYVE2o?t=33

TODO: Figure out formula to reset controller's
x position after max_w is reset to >240.
If 240 is used with just x = view_xview[0] its
seamless but the offset for the wobblescroll
formula is causing issues.
*/
global.level = 63;
global.pausable = true;
global.omake_enabled = false;
stage_time = 0;
completedelay = 0;

scr_camera_init(0,room_width-240,0,-0.5);
obj_ctrl_camera.range = room_width;

instance_create_layer(room_width/2,y+240,layer,obj_ctrl_game);