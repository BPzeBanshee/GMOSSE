var p,s;
p = 1; // proportional fonts
s = 1; // separation between glyphs by pixels?

// default font set
if global.fonttype = 0  
    {
    font_replace_sprite(global.fnt_default,spr_fnt_default,ord(" "),p,s);
    font_replace_sprite(global.fnt_debug,spr_fnt_debug,ord(" "),p,s);
    font_replace_sprite(global.fnt_little,spr_fnt_little,ord(" "),p,s);
    font_replace_sprite(global.fnt_big,spr_fnt_big,ord(" "),p,s);
    font_replace_sprite(global.fnt_shipselect,spr_fnt_shipselect,ord(" "),p,s);
    }
    
// Emerald Master's alternate font set    
if global.fonttype = 1
    {
    font_replace_sprite(global.fnt_default,spr_fnt_default_alt,ord(" "),p,s);
    font_replace_sprite(global.fnt_debug,spr_fnt_debug_alt,ord(" "),p,s);
    font_replace_sprite(global.fnt_little,spr_fnt_little_alt,ord(" "),p,s);
    font_replace_sprite(global.fnt_big,spr_fnt_big_alt,ord(" "),p,s);
    font_replace_sprite(global.fnt_shipselect,spr_fnt_shipselect_alt,ord(" "),p,s);
    }
