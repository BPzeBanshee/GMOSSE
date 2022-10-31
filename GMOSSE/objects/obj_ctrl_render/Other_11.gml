/// @description  Generating scanlines
if !window_has_focus()
    {
    /*trace("event_user(1) called while focus lost, l_scan_scale: "
    +string(l_scan_scale)
    +", l_scale: "+string(l_scan_scale)
    +", application surface size at: "+string(surface_get_width(application_surface))
    +"x"+string(surface_get_height(application_surface)));*/
    exit;
    }
    
var w,h,s,sw,sh; 
// Get surface values
w = surface_get_width(application_surface)*l_scale; 
h = surface_get_height(application_surface)*l_scale;

// Decide what kind of scanline to use
m_scanlines = global.scanlines;
l_scan_scale = l_scale; // for changing from clean to stretch
switch m_scanlines
    {
    default: s = -1; break;
    case 1: s = spr_scanline_hori; break;
    case 2: s = spr_scanline_vert; break;
    case 3: s = spr_static; break;
    }
sw = sprite_get_width(s);
sh = sprite_get_height(s);

// Create surface
if surface_exists(l_scan)
    {
    if surface_get_width(l_scan) != w || surface_get_height(l_scan) != h
    then surface_resize(l_scan,w,h);
    }
else l_scan = surface_create(w,h);

// Draw scanlines onto surface
surface_set_target(l_scan);
draw_clear_alpha(c_black,0);
draw_set_color(c_black);
draw_set_alpha(1);

var si = 0;
if sprite_exists(s) 
then for (var i=0;i<w;i+=sw)
    {
    for (var j=0;j<h;j+=sh)
        {
        if m_scanlines == 3 then si = irandom_range(0,sprite_get_number(spr_static)-1);
        draw_sprite(s,si,i,j);
        }
    }

/*if m_scanlines = 1 then for(i=0;i<h;i+=2) draw_line(-1,i,w,i); // Horizontal
if m_scanlines = 2 then for(i=0;i<w;i+=2) draw_line(i,-1,i,h); // Vertical
if m_scanlines = 3 // Static drawing
    {
    for (i=0;i<w;i+=sprite_get_width(spr_static))
        {
        for (j=0;j<h;j+=sprite_get_height(spr_static))
            {
            draw_sprite(spr_static,irandom_range(0,sprite_get_number(spr_static)-1),i,j);
            }
        }
    }*/
surface_reset_target();

/* */
/*  */
