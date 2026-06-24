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
window_set_max_width(display_get_width());
window_set_max_height(display_get_height());
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
l_firstrun = false;
l_scale = 1;  // automatically calculated in step
l_delay = 12; // masks funny behaviour while changing window size
lw_width = m_base_w;
lw_height = m_base_h;
l_res = string(lw_width)+"x"+string(lw_height);
l_wall_img[0] = bkg_wallpaper;
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
m_array_w[2,3] = 960; m_array_h[2,3] = 540; // nHD
m_array_w[2,4] = 1024; m_array_h[2,4] = 576;
m_array_w[2,5] = 1280; m_array_h[2,5] = 720; // HD
m_array_w[2,6] = 1366; m_array_h[2,6] = 768; // WXGA
m_array_w[2,7] = 1600; m_array_h[2,7] = 900; // HD+
m_array_w[2,8] = 1920; m_array_h[2,8] = 1080; // Full HD
m_array_w[2,9] = 2560; m_array_h[2,9] = 1440; // QHD
m_array_w[2,10] = 3200; m_array_h[2,10] = 1800; // QHD+
m_array_w[2,11] = 3840; m_array_h[2,11] = 2160; // 4K UHD
m_array_w[2,12] = 5120; m_array_h[2,12] = 2880; // 5K UHD
m_array_w[2,13] = 7680; m_array_h[2,13] = 4320; // 8K UHD

// 16:10
m_array_w[3,0] = 640; m_array_h[3,0] = 400;
m_array_w[3,1] = 960; m_array_h[3,1] = 600;
m_array_w[3,2] = 1280; m_array_h[3,2] = 800; // WXGA
m_array_w[3,3] = 1440; m_array_h[3,3] = 900; // WXGA+
m_array_w[3,4] = 1680; m_array_h[3,4] = 1050; // WSXGA+
m_array_w[3,5] = 1920; m_array_h[3,5] = 1200; // WUXGA
m_array_w[3,6] = 2560; m_array_h[3,6] = 1600; // WQXGA
m_array_w[3,7] = 3840; m_array_h[3,7] = 2400; // WQUXGA

alarm[2] = 1;
alarm[0] = l_delay;