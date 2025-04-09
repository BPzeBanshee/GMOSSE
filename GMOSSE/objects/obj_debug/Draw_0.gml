if global.debug
    {
    // Init colour, positions, font etc
	var c = make_color_rgb(90,218,90);
    scr_draw_vars(global.fnt_little,fa_right,c);
    draw_set_alpha(1);
	
    // Reduce opacity if player is nearby
    if instance_exists(obj_player)
        {
		var condition = (obj_player.y > yview+268 && obj_player.x > xview+188);
		draw_set_alpha(condition ? 0.5 : 1);
        }
        
    // Display debug data
    var str = "";
    //var mx = round(device_mouse_raw_x(0));
    //var my = round(device_mouse_raw_y(0));
    str += string(rfps_txt)+" RFPS\n";
    str += "S:"+string(global.step)+", I:"+string(instance_count)+"\n";
    str += string(fps)+" FPS";
	
	if global.paused
		{
		draw_set_color(c_black);
		draw_rectangle(xview+240-48,yview+290,xview+240,yview+320,false);
		draw_set_color(c);
		}
	
    draw_text(xview+240,yview+290,str);
    /*draw_text(xview+240,yview+280,string(device_mouse_x(0)+", "+device_mouse_y(0)));
    draw_text(xview+240,yview+290,string(rfps_txt)+" RFPS");
    draw_text(xview+240,yview+300,"S:"+string(global.step)+", I:"+string(instance_count));
    draw_text(xview+240,yview+310,string(fps)+" FPS");*/
    }