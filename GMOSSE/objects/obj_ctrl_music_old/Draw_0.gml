if room == rm_init || info != 0 then exit;
var oa; oa = draw_get_alpha();
scr_draw_vars(global.fnt_little,fa_left,make_color_rgb(90,130,255));

if !instance_exists(obj_ctrl_pause)
    {
    timer += 1;
    if timer < 360 && alpha < 1 then alpha += 0.01;
    if timer > 360 && alpha > 0 then alpha -= 0.01;
    }
draw_set_alpha(alpha);

if instance_exists(obj_ctrl_game) //ingame
    {
    draw_text(xview,yview+284,"* "+string(global.music_info[4]));
    if timer < 180 
    then draw_text(xview,yview+294,"* "+string(global.music_info[5]))
    else draw_text(xview,yview+294,"* "+string(global.music_info[6]));    
    }
else if !instance_exists(obj_ctrl_pause) //menus
    {
    draw_text(xview,yview+300,"* "+string(global.music_info[4]));
    if timer < 180
    then draw_text(xview,yview+310,"* "+string(global.music_info[5]));
    else draw_text(xview,yview+310,"* "+string(global.music_info[6]));
    }
    
if debug
    {
    var l,p;
    l = AStreamGetLength(music);
    p = AStreamGetPosition(music);
    draw_set_alpha(1);
    draw_text(xview,yview+280,(string(p)+" / "+string(l)));
    }
    
draw_set_alpha(oa);

