if l_delay > 0 then l_delay -= 1;

if m_size != global.window_size 
or m_aspect != global.window_aspect 
then event_user(0);

if window_get_width() != browser_width
|| window_get_height() != browser_height-4
then event_user(0);

/*
if !global.fullscreen
then if window_get_width() != m_array_w[m_aspect,m_size]
|| window_get_height() != m_array_h[m_aspect,m_size] 
then event_user(0);
*/
// DEBUG COMMANDS
/*
// Adjust angle as needed (no more view_angle!)
if keyboard_check_pressed(ord("Q")) 
    {
    m_angle -= 90; if m_angle < 0 then m_angle = 270;
    }
if keyboard_check_pressed(ord("E")) 
    {
    m_angle += 90; if m_angle > 270 then m_angle = 0;
    }

// Set scaling to clean or proportional
if keyboard_check_pressed(ord("R")) then m_clean = !m_clean;

// Set window size according to aspect ratio size and update window
if keyboard_check_pressed(ord("T"))
    {
    m_size += 1;
    if m_size > l_max_size then m_size = 0;
    event_user(0);
    }
    
// Set aspect ratio and update window
if keyboard_check_pressed(ord("Y"))
    {
    m_aspect += 1;
    if m_aspect > 3 then m_aspect = 0;
    event_user(0);
    }
    
// Toggle Wallpaper
if keyboard_check_pressed(ord("U")) then m_wallpaper = !m_wallpaper;
*/

/// Update x/y and scale size
// Adjust scale as needed (no more viewports, hooray!)
m_angle = global.rotation;
m_clean = global.scaling;
//m_wallpaper = global.use_wallpaper;
if m_angle == 90 || m_angle == 270
then l_scale = min(window_get_width()/m_base_h,window_get_height()/m_base_w)
else l_scale = min(window_get_width()/m_base_w,window_get_height()/m_base_h);
if m_clean then l_scale = max(1,floor(l_scale));

// Offset x/y for centering the drawn surface
x = round(window_get_width()/2);
y = round(window_get_height()/2);
xx = x - lengthdir_x((m_base_w/2)*l_scale,m_angle) - lengthdir_x((m_base_h/2)*l_scale,m_angle+270);
yy = y - lengthdir_y((m_base_w/2)*l_scale,m_angle) - lengthdir_y((m_base_h/2)*l_scale,m_angle+270);

/*if os_browser != browser_not_a_browser
    {
    if browser_height > window_get_height() || browser_width > window_get_width()
        {
        var wx, wy;
        if browser_width > window_get_width()
        then wx = (browser_width - window_get_width()) / 2
        else wx = 0;
        if browser_height > window_get_height()
        then wy = (browser_height - window_get_height()) / 2
        else wy = 0;
        window_set_position(wx,wy);
        }
    }*/