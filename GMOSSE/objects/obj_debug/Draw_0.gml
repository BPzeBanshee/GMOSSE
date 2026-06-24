if global.debug
    {
    // Init colour, positions, font etc
	var c = make_color_rgb(90,218,90);
    scr_draw_vars(global.fnt_tiny,fa_right,c);
    draw_set_alpha(1);
	var dx = xview+240;
	var dy = yview+302;
	
    // Reduce opacity if player is nearby
    if instance_exists(obj_player)
        {
		var condition = (obj_player.y > yview+278 && obj_player.x > xview+188);
		draw_set_alpha(condition ? 0.5 : 1);
        }
        
    // Display debug data
    var str = "";
    str += string(rfps_txt)+" RFPS\n";
    str += "S:"+string(global.step)+", I:"+string(instance_count)+"\n";
    str += string(fps)+" FPS";
	
	if global.paused or instance_exists(obj_ctrl_gameover)
		{
		draw_set_color(c_black);
		draw_rectangle(dx-48,dy,dx,yview+320,false);
		draw_set_color(c);
		}
	
    draw_text(dx,dy,str);
    }