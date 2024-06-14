///@desc Generating scanlines
if !window_has_focus() exit;
    
// Decide what kind of scanline to use
m_scanlines = global.scanlines;
l_scan_scale = l_scale; // for changing from clean to stretch
var s = -1;
switch m_scanlines
    {
    case 1: s = spr_scanline_hori; break;
    case 2: s = spr_scanline_vert; break;
    case 3: s = spr_static; break;
    }
	
if s == -1 exit;
var sw = sprite_get_width(s);
var sh = sprite_get_height(s);

// Get surface values
var w = surface_get_width(application_surface) * l_scale; 
var h = surface_get_height(application_surface) * l_scale;

// Then create scanline surface
if surface_exists(l_scan)
    {
    if surface_get_width(l_scan) != w || surface_get_height(l_scan) != h
    surface_resize(l_scan,w,h);
    }
else l_scan = surface_create(w,h);

// Draw scanlines onto surface
surface_set_target(l_scan);
draw_clear_alpha(c_black,0);
draw_set_color(c_black);
draw_set_alpha(1);

var si = 0;
if sprite_exists(s) 
	{
	for (var i=0; i<w; i+=sw)
	    {
	    for (var j=0; j<h; j+=sh)
	        {
	        if m_scanlines == 3 si = irandom_range(0,sprite_get_number(spr_static)-1);
	        draw_sprite(s,si,i,j);
	        }
	    }
	}
surface_reset_target();