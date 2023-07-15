/*
obj_ctrl_render, by BPzeBanshee

At last, a modern render system that doesn't chew up a
stupid amount of performance in the process of handling surfaces!

This render system's end result is designed to be very similar to that
of Blue Revolver's video options: free control of the game scale and
rotation without GM's stupid view_angle glitches while looking pretty.
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
m_wallpaper = global.use_wallpaper; // draw wallpaper (off/1-5)?
m_scanlines = global.scanlines;     // scanlines (off/horizontal/vertical)
m_filter_bi = global.filter;        // interpolation of textures/bilinear filter (off/on)

// Define self-configured variables
xx = x;
yy = y;
l_firstrun = 0;
l_scale = 1;  // automatically calculated in step
l_delay = 12; // masks funny behaviour while changing window size
l_res = "";
l_wall_img[0] = bkg_wallpaper;
//l_wall_w = 1920;
//l_wall_h = 1080;
//l_wall_s = 1;
//l_wall_max_s = 1;
l_scan = -1;
l_scan_scale = l_scale;

// Define control aspect ratio settings for windowed mode
// 3:4
m_array_w[0,0] = 240; m_array_h[0,0] = 320;
m_array_w[0,1] = 480; m_array_h[0,1] = 640;
m_array_w[0,2] = 720; m_array_h[0,2] = 960;

// 4:3
m_array_w[1,0] = 640; m_array_h[1,0] = 480;
m_array_w[1,1] = 800; m_array_h[1,1] = 600;
m_array_w[1,2] = 1024; m_array_h[1,2] = 768;
m_array_w[1,3] = 1280; m_array_h[1,3] = 1024;

// 16:9
m_array_w[2,0] = 640; m_array_h[2,0] = 360;
m_array_w[2,1] = 720; m_array_h[2,1] = 405;
m_array_w[2,2] = 848; m_array_h[2,2] = 480;
m_array_w[2,3] = 960; m_array_h[2,3] = 540;
m_array_w[2,4] = 1024; m_array_h[2,4] = 576;
m_array_w[2,5] = 1280; m_array_h[2,5] = 720;
m_array_w[2,6] = 1366; m_array_h[2,6] = 768;
m_array_w[2,7] = 1600; m_array_h[2,7] = 900;
m_array_w[2,8] = 1920; m_array_h[2,8] = 1080;
m_array_w[2,9] = 2560; m_array_h[2,9] = 1440;
m_array_w[2,10] = 3840; m_array_h[2,10] = 2160;

// 16:10
m_array_w[3,0] = 1280; m_array_h[3,0] = 800;
m_array_w[3,1] = 1440; m_array_h[3,1] = 900;
m_array_w[3,2] = 1680; m_array_h[3,2] = 1050;
m_array_w[3,3] = 1920; m_array_h[3,3] = 1200;
m_array_w[3,4] = 2560; m_array_h[3,4] = 1600;

alarm[2] = 5;
alarm[0] = l_delay;