// Draw cover rectangle
draw_set_alpha(0.75);
draw_set_color(c_black);
draw_rectangle(xview+20,yview+235,xview+220,yview+235+rect_h,0);

// Set text vars
scr_draw_vars(global.fnt_default,fa_center,make_color_rgb(170,170,255));
draw_set_alpha(1);
draw_text(xview+120,yview+240,string(msg)); // draws the message

if control > 1 // Non-keyboard display
    {
    var pad_str = string(global.joy_id);
    if control == 2 && mode == 3
        {
        pad_str = string(pad_list[select]);
        if select > min_s draw_sprite_ext(spr_shipselect,-1,xview+50,yview+265,-1,1,0,c_white,1);
        if select < max_s draw_sprite_ext(spr_shipselect,-1,xview+190,yview+265,1,1,0,c_white,1);
        } 
    draw_text(xview+120,yview+260,"ID: "+pad_str);
    draw_text(xview+120,yview+270,string(desc));
    }