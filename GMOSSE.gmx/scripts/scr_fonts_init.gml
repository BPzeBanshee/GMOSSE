var p,s;
p = 1; // proportional font
s = 2; // separation between font sprites in pixels?

// font used in Main Menu
global.fnt_menu=font_add_sprite(spr_fnt_menu,33,p,s);

// default font set
if global.fonttype = 0  
    {
    global.fnt_default = font_add_sprite(spr_fnt_default,33,p,s);
    global.fnt_debug = font_add_sprite(spr_fnt_debug,33,p,s);
    global.fnt_little = font_add_sprite(spr_fnt_little,33,p,s);
    global.fnt_big = font_add_sprite(spr_fnt_big,33,p,s);
    global.fnt_shipselect = font_add_sprite(spr_fnt_shipselect,33,p,s);
    }
    
// Emerald Master's alternate font set    
if global.fonttype = 1
    {
    global.fnt_default = font_add_sprite(spr_fnt_default_alt,33,p,s);
    global.fnt_debug = font_add_sprite(spr_fnt_debug_alt,33,p,s);
    global.fnt_little = font_add_sprite(spr_fnt_little_alt,33,p,s);
    global.fnt_big = font_add_sprite(spr_fnt_big_alt,33,p,s);
    global.fnt_shipselect = font_add_sprite(spr_fnt_shipselect_alt,33,p,s);
    }
