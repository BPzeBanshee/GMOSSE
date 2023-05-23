if room == rm_init || info != 0 then exit;
var oa = draw_get_alpha();
scr_draw_vars(global.fnt_little,fa_left,make_color_rgb(90,130,255));

if !instance_exists(obj_ctrl_pause)
    {
    timer += 1;
    if timer < 360 && alpha < 1 then alpha += 0.01;
    if timer > 360 && alpha > 0 then alpha -= 0.01;
    }
draw_set_alpha(alpha);
if !instance_exists(obj_ctrl_pause) //menus
	{
	var yy = yview+300;
	if instance_exists(obj_ctrl_game) then yy = yview+284;  //ingame
	
	draw_text(xview,yy,"* "+string(music_info[4]));
    if timer < 180
    then draw_text(xview,yy+10,"* "+string(music_info[5]));
    else draw_text(xview,yy+10,"* "+string(music_info[6]));
	} 
draw_set_alpha(oa);