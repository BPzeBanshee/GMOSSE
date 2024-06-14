/// @description  Set Window size according to aspect etc
if !window_has_focus()
    {
    /*trace("event_user(0) called while focus lost, m_size: "
    +string(m_size)
    +", global.window_size: "+string(global.window_size)
    +", m_aspect: "+string(m_aspect)
    +", global.window_aspect: "+string(global.window_aspect));*/
    exit;
    }

// First, update the maximum array iteration size
m_aspect = global.window_aspect;
var l_max_size = array_length(m_array_w[m_aspect])-1;
if global.window_size > l_max_size global.window_size = l_max_size;

// Then check the maximum size for our current display, and bound global.window_size to it
if m_array_w[m_aspect,global.window_size] > display_get_width()
while m_array_w[m_aspect,global.window_size] > display_get_width() global.window_size -= 1;
if m_array_h[m_aspect,global.window_size] > display_get_height()
while m_array_h[m_aspect,global.window_size] > display_get_height() global.window_size -= 1;
m_size = min(global.window_size,l_max_size);

// Then pluck the array variables and adjust window size accordingly
var w,h;
w = m_array_w[m_aspect,m_size];
h = m_array_h[m_aspect,m_size];
window_set_size(w,h);

if !l_firstrun 
    {
    // if we center in consecutive runs on Win7 we get garbage graphics
    // and if we just use window_center it's even worse
    var xx,yy,dw,dh;
    dw = display_get_width();
    dh = display_get_height();
    xx = (dw / 2) - (w / 2);
    yy = (dh / 2) - (h / 2);
    if window_get_x() != xx || window_get_y() != yy
    window_set_position(xx,yy);
    l_firstrun = 1;
    }

l_res = string(w)+"x"+string(h);
if !window_get_fullscreen()
    {
    l_delay = 11;
    alarm[1] = 11;
    }
else alarm[1] = 2;

//trace("obj_ctrl_render: event user 0, w: "+string(w)+", h: "+string(h));