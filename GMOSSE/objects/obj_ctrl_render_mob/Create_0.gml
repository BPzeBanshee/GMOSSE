/*
obj_ctrl_render_mob, by BPzeBanshee

HIGHLY EXPERIMENTAL RENDERER FOR HTML5 TARGET, USE AT YOUR OWN PERIL
*/
// Define base resolution (modify event_user(0)'s smaller entries if changing this though)
m_base_w = 240;
m_base_h = 320;
window_set_min_width(m_base_w);
window_set_min_height(m_base_h);
application_surface_draw_enable(false);
surface_resize(application_surface,m_base_w,m_base_h);

// Define configurable variables
m_aspect = global.window_aspect;    // aspect ratio, 0=3:4 (native), 1=4:3, 2=16:9, 3=16:10
m_size = global.window_size;        // selector var for resolution list (see event_user(0))
m_angle = global.rotation;          // angle of screen in degrees
m_clean = global.scaling;           // proportional or clean scale
m_wallpaper = global.use_wallpaper; // draw wallpaper (y/n)?
event_user(1);

// Define self-configured variables
l_scale = 1;  // automatically calculated in step
l_delay = 0; // masks funny behaviour while changing window size
l_res = "";
xx = x;
yy = y;

event_user(0); // set window size according to selected resolution

/* */
/*  */
