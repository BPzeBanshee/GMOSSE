if !enabled exit;
scr_input();

// Creates Pause object if button4 is pressed, game is not paused already and is allowed
if global.button4 && global.pausable 
&& !instance_exists(obj_ctrl_pause)
instance_create_layer(0,0,global.lay_ctrl,obj_ctrl_pause);