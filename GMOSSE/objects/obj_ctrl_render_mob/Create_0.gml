/*
obj_ctrl_render_mob, by BPzeBanshee

HIGHLY EXPERIMENTAL RENDERER FOR GX.GAMES/HTML5 TARGET, USE AT YOUR OWN PERIL
*/
event_inherited();

// Disable double click support (historically messes with inputs, pending rework)
device_mouse_dbclick_enable(false);
gpu_set_texfilter(false);

// Define self-configured variables
l_firstrun = true;
l_delay = 0; // masks funny behaviour while changing window size
m_fullscreen = false;

//increase_window_size = function(){};
//decrease_window_size = function(){};

//event_user(0); // set window size according to selected resolution