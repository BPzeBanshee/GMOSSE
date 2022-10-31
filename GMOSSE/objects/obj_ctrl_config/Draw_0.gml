/// @description  DRAW MENU CODE
if !enabled exit;
// INIT
scr_draw_vars(global.fnt_default,fa_left,c_black);
var g; g = 10;

// DRAW BLACK BOX
draw_set_alpha(0.75);
draw_rectangle(xview+25,yview+s-8,xview+215,yview+s+(g*(selection_max+3))+max_h,0);

// DRAW CATEGORY TEXT
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(xview+60,yview+s,string(category_type));
        
// ----------------- MAIN EVENT --------------
draw_set_color(8454016);

// ------ MAIN CONFIG MENU ------
if category == 0
    {
    // TEXT
    draw_text(xview+60,yview+s+(g*1),"CONTROL SETTINGS");
    draw_text(xview+60,yview+s+(g*2),"VIDEO SETTINGS");
    draw_text(xview+60,yview+s+(g*3),"AUDIO SETTINGS");
    draw_text(xview+60,yview+s+(g*4),"MISC. SETTINGS");
    
    draw_text(xview+60,yview+s+(g*6),"EXIT CONFIG");
    }
    
// ------ CONTROLS CONFIG MENU -----
if category == 1
    {
    // BEHAVIOURS
    var dz,du;
    dz = string(round(global.deadzone*100))+"%";
    if global.deadzone == 0 then dz = "EXACT";
    switch global.joytype
        {
        case 0: du = "AXES"; break;
        case 1: du = "DPAD"; break;
        case 2: du = "BOTH"; break;
        }
    
    // TEXT
    draw_text(xview+60,yview+s+(g*1),"DEFINE KEYBOARD");
    draw_text(xview+60,yview+s+(g*2),"DEFINE JOYSTICK");
    draw_text(xview+60,yview+s+(g*3),"DEADZONE: "+string(dz)); 
    draw_text(xview+60,yview+s+(g*4),"JOYSTICK U/D/L/R: "+string(du));
    
    draw_text(xview+60,yview+s+(g*6),"RETURN TO MENU");
    }
    
// ------ VIDEO CONFIG MENU ------
if category == 2
    {
    // BEHAVIOURS
	var full_str,vsync_str,tate_str,aa_str;
    if global.fullscreen then full_str = "ON" else full_str = "OFF";
    if global.vsync then vsync_str = "ON" else vsync_str = "OFF";
    switch global.aa
        {
        case 0: aa_str = "OFF"; break;
        case 1: aa_str = "2xAA"; break;
        case 2: aa_str = "4xAA"; break;
        case 3: aa_str = "8xAA"; break;
        }
    tate_str = string(global.rotation)+"*";
    
	var aspect_str,winsize_str,scale_str,wallpaper_str;
    switch global.window_aspect
        {
        case 0: aspect_str = "3:4 (NATIVE)"; break;
        case 1: aspect_str = "4:3"; break;
        case 2: aspect_str = "16:9"; break;
        case 3: aspect_str = "16:10"; break;
        }
    winsize_str = obj_ctrl_render.l_res;
    if global.scaling then scale_str = "CLEAN" else scale_str = "STRETCH";
    if global.use_wallpaper then wallpaper_str = "ON" else wallpaper_str = "OFF";
    
    // TEXT
    draw_text(xview+60,yview+s+(g*1),"FULLSCREEN: "+string(full_str));
    draw_text(xview+60,yview+s+(g*2),"VSYNC: "+string(vsync_str));
    draw_text(xview+60,yview+s+(g*3),"ANTIALIASING: "+string(aa_str));
    draw_text(xview+60,yview+s+(g*4),"ROTATION: "+string(tate_str));
    draw_text(xview+60,yview+s+(g*5),"WIN. ASPECT: "+string(aspect_str));
    draw_text(xview+60,yview+s+(g*6),"WIN. SIZE: "+string(winsize_str));
    draw_text(xview+60,yview+s+(g*7),"SCALING: "+string(scale_str));
    draw_text(xview+60,yview+s+(g*8),"WALLPAPER: "+string(wallpaper_str));
    
    draw_text(xview+60,yview+s+(g*10),"CONFIGURE FILTERS");
    draw_text(xview+60,yview+s+(g*11),"RETURN TO MENU");
    
    // WARNING TEXT
    if warning != ""
        {
        draw_set_halign(fa_center);
        draw_set_color(c_red);
        draw_text(xview+120,yview+s+(g*15),string(warning));
        }
    }
    
// ------ FILTER OPTIONS SUB-MENU ------
if category == 3
    {
    // BEHAVIOURS
	var wallbright_str,alpha_str,filter_str,scan_str;
    wallbright_str = string(round(global.wallbrightness))+"%";
    if global.filter = 1 then filter_str = "ON" else filter_str = "OFF";
    switch global.scanlines
        {
        case 0: scan_str = "NONE"; break;
        case 1: scan_str = "HORIZONTAL"; break;
        case 2: scan_str = "VERTICAL"; break;
        case 3: scan_str = "STATIC"; break;
        }
    alpha_str = string(round(global.scanline_alpha))+"%";
        
    // TEXT
    draw_text(xview+60,yview+s+(g*1),"WALLPAPER ALPHA: "+string(wallbright_str));
    draw_text(xview+60,yview+s+(g*2),"BILINEAR FILTER: "+string(filter_str));
    draw_text(xview+60,yview+s+(g*3),"SCANLINES: "+string(scan_str));
    draw_text(xview+60,yview+s+(g*4),"SCANLINE ALPHA: "+string(alpha_str));
    
    draw_text(xview+60,yview+s+(g*6),"RETURN TO VIDEO");
    }


// ------ VOLUME CONFIG MENU ------
if category == 4
    {
    // BEHAVIOURS
    var vol_music,vol_sfx,vol_voice;
    vol_music = string(global.music_volume)+"%";
    if global.music_volume = 100 then vol_music = "MAX";
    if global.music_volume = 0 then vol_music = "OFF";

    vol_sfx = string(global.sfx_volume)+"%";
    if global.sfx_volume = 100 then vol_sfx = "MAX";
    if global.sfx_volume = 0 then vol_sfx = "OFF";
    
    vol_voice = string(global.voice_volume)+"%";
    if global.voice_volume = 100 then vol_voice = "MAX";
    if global.voice_volume = 0 then vol_voice = "OFF";
    
    // TEXT
    draw_text(xview+60,yview+s+(g*1),"MUSIC VOLUME: "+string(vol_music));
    draw_text(xview+60,yview+s+(g*2),"SFX VOLUME: "+string(vol_sfx));
    draw_text(xview+60,yview+s+(g*3),"VOICE VOLUME: "+string(vol_voice));
    draw_text(xview+60,yview+s+(g*4),"DEFINE MUSIC PACK");
    
    draw_text(xview+60,yview+s+(g*6),"RETURN TO MENU");
    }
    
// ------ MISC. OPTIONS MENU ------
if category == 5
    {
    // BEHAVIOURS
    var debug_str,font_str,hitbox_str,b_str,flicker_str;
    if global.debug then debug_str = "ON" else debug_str = "OFF";
    if global.fonttype then font_str = "ON" else font_str = "OFF";
    if global.hitbox_visible then hitbox_str = "VISIBLE" else hitbox_str = "HIDDEN";
    switch global.bulletcolour
        {
        case 1: b_str = "BLUE"; break;
        case 2: b_str = "RED"; break;
        case 3: b_str = "MIXED"; break;
        }
    if global.flicker then flicker_str = "ON" else flicker_str = "OFF";
    
    // TEXT
    draw_text(xview+60,yview+s+(g*1),"DEBUG DISPLAY: "+string(debug_str));
    draw_text(xview+60,yview+s+(g*2),"HITBOX: "+string(hitbox_str));
    draw_text(xview+60,yview+s+(g*3),"ALT. FONTSET: "+string(font_str));
    draw_text(xview+60,yview+s+(g*4),"BULLET COLOUR: "+string(b_str));
    draw_text(xview+60,yview+s+(g*5),"EXPLOSION FLICKER: "+string(flicker_str));
    draw_text(xview+60,yview+s+(g*6),"RESET HIGHSCORES");
    
    draw_text(xview+60,yview+s+(g*8),"RETURN TO MENU");
    
    if timer > 0
        {
        draw_set_color(c_white);
        draw_text(xview+60,yview+s+(g*10),"HIGH SCORES RESET!");
        }
    }
    
var i = 0;
if selection == selection_max then i = 10;
if category == 2 then if selection == selection_max - 1 then i = 10;
draw_sprite(spr_shipselect,-1,xview+45,yview+s+5+(g*selection+i));
    
// ----------------- END MAIN EVENT --------------

