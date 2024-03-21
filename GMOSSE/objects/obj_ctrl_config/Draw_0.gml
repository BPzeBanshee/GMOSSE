/// @desc DRAW MENU CODE

/*
Note: compared to legacy builds this Draw code 
makes considerable use of ternary operators 
(value = [condition] ? [value if true] : [value if false])
for single-line readability. Using an old-fashioned
if/then/else is totally acceptable too if that's how you roll.
*/

// INIT
if !enabled exit;
scr_draw_vars(global.fnt_default,fa_left,c_black);
var g = 10;

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
    var dz = string(round(global.deadzone*100))+"%";
    if global.deadzone == 0 then dz = "EXACT";
	var du;
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
	var full_str = global.fullscreen ? "ON" : "OFF";
	var vsync_str = global.vsync ? "ON" : "OFF";
	var aa_str;
    switch global.aa
        {
        case 0: aa_str = "OFF"; break;
        case 1: aa_str = "2xAA"; break;
        case 2: aa_str = "4xAA"; break;
        case 3: aa_str = "8xAA"; break;
        }
    var tate_str = string(global.rotation)+"*";
    
	var aspect_str;
    switch global.window_aspect
        {
        case 0: aspect_str = "3:4 (NATIVE)"; break;
        case 1: aspect_str = "4:3"; break;
        case 2: aspect_str = "16:9"; break;
        case 3: aspect_str = "16:10"; break;
        }
    var winsize_str = obj_ctrl_render.l_res;
    var scale_str = global.scaling ? "CLEAN" : "STRETCH";
    var wallpaper_str = global.use_wallpaper ? "ON" : "OFF";
    
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
    var wallbright_str = string(round(global.wallbrightness))+"%";
	var filter_str = global.filter ? "ON" : "OFF";
	var scan_str;
    switch global.scanlines
        {
        case 0: scan_str = "NONE"; break;
        case 1: scan_str = "HORIZONTAL"; break;
        case 2: scan_str = "VERTICAL"; break;
        case 3: scan_str = "STATIC"; break;
        }
    var alpha_str = string(round(global.scanline_alpha))+"%";
        
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
    var vol_music = string(global.music_volume)+"%";
    if global.music_volume == 100 then vol_music = "MAX";
    if global.music_volume == 0 then vol_music = "OFF";

    var vol_sfx = string(global.sfx_volume)+"%";
    if global.sfx_volume == 100 then vol_sfx = "MAX";
    if global.sfx_volume == 0 then vol_sfx = "OFF";
    
    var vol_voice = string(global.voice_volume)+"%";
    if global.voice_volume == 100 then vol_voice = "MAX";
    if global.voice_volume == 0 then vol_voice = "OFF";
    
    // TEXT
    draw_text(xview+60,yview+s+(g*1),"MUSIC VOLUME: "+string(vol_music));
    draw_text(xview+60,yview+s+(g*2),"SFX VOLUME: "+string(vol_sfx));
    draw_text(xview+60,yview+s+(g*3),"VOICE VOLUME: "+string(vol_voice));
	
	var safety_check = room == rm_menu ? true : false;
	if !safety_check then draw_set_color(c_red);
    draw_text(xview+60,yview+s+(g*4),"DEFINE MUSIC PACK");
    if !safety_check then draw_set_color(8454016);
	
    draw_text(xview+60,yview+s+(g*6),"RETURN TO MENU");
	
	// WARNING TEXT
    if warning != ""
        {
        draw_set_halign(fa_center);
        draw_set_color(c_red);
        draw_text(xview+120,yview+s+(g*9),string(warning));
        }
    }
    
// ------ MISC. OPTIONS MENU ------
if category == 5
    {
    // BEHAVIOURS
	var debug_str = global.debug ? "ON" : "OFF";
	var font_str = global.fonttype ? "ON" : "OFF";
	var hitbox_str = global.hitbox_visible ? "VISIBLE" : "HIDDEN";
	var flicker_str = global.flicker ? "ON" : "OFF";
	var b_str;
    switch global.bulletcolour
        {
        case 1: b_str = "BLUE"; break;
        case 2: b_str = "RED"; break;
        case 3: b_str = "MIXED"; break;
        }
    
    
    // TEXT
    draw_text(xview+60,yview+s+(g*1),"DEBUG DISPLAY: "+string(debug_str));
    draw_text(xview+60,yview+s+(g*2),"HITBOX: "+string(hitbox_str));
    draw_text(xview+60,yview+s+(g*3),"ALT. FONTSET: "+string(font_str));
    draw_text(xview+60,yview+s+(g*4),"BULLET COLOUR: "+string(b_str));
    draw_text(xview+60,yview+s+(g*5),"EXPLOSION FLICKER: "+string(flicker_str));
    draw_text(xview+60,yview+s+(g*6),"RESET HIGHSCORES");
	draw_text(xview+60,yview+s+(g*7),"RESET CONFIG");
    
    draw_text(xview+60,yview+s+(g*9),"RETURN TO MENU");
    
    if timer > 0
        {
        draw_set_color(c_white);
        draw_text(xview+60,yview+s+(g*11),reset_msg);
        }
    }
    
var i = 0;
if selection == selection_max then i = 10;
if category == 2 then if selection == selection_max - 1 then i = 10;
draw_sprite(spr_shipselect,-1,xview+45,yview+s+5+(g*selection+i));
    
// ----------------- END MAIN EVENT --------------

