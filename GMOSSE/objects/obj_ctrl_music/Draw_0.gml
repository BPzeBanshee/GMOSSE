if showing_info && !instance_exists(obj_ctrl_pause) //menus
	{
	var oa = draw_get_alpha();
	scr_draw_vars(global.fnt_little,fa_left,make_color_rgb(90,130,255));
	
	var yy = yview+300;
	if instance_exists(obj_ctrl_game) yy = yview+284;  //ingame
	
	draw_set_alpha(alpha);
	
	draw_text(xview,yy,"* "+string(music[4]));
    if timer < 180
    draw_text(xview,yy+10,"* "+string(music[5]));
    else draw_text(xview,yy+10,"* "+string(music[6]));
	
	draw_set_alpha(oa);
	}