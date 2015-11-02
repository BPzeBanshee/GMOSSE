var p,s;
p = 1; // proportional fonts
s = 2; // separation between glyphs by pixels?

// default font set
if global.fonttype = 0  
    {
    font_replace_sprite(global.fnt_default,spr_fnt_default,33,p,s);
    font_replace_sprite(global.fnt_debug,spr_fnt_debug,33,p,s);
    font_replace_sprite(global.fnt_little,spr_fnt_little,33,p,s);
    font_replace_sprite(global.fnt_big,spr_fnt_big,33,p,s);
    font_replace_sprite(global.fnt_shipselect,spr_fnt_shipselect,33,p,s);
    }
    
// Emerald Master's alternate font set    
if global.fonttype = 1
    {
    font_replace_sprite(global.fnt_default,spr_fnt_default_alt,33,p,s);
    font_replace_sprite(global.fnt_debug,spr_fnt_debug_alt,33,p,s);
    font_replace_sprite(global.fnt_little,spr_fnt_little_alt,33,p,s);
    font_replace_sprite(global.fnt_big,spr_fnt_big_alt,33,p,s);
    font_replace_sprite(global.fnt_shipselect,spr_fnt_shipselect_alt,33,p,s);
    }
