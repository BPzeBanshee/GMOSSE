if global.debug
    {
    // Init colour, positions, font etc
    scr_draw_vars(global.fnt_little,fa_right,make_color_rgb(90,218,90));
    
    // Reduce opacity if player is nearby
    if instance_exists(obj_player)
        {
        if obj_player.y > yview+268 
        && obj_player.x > xview+188 
        then draw_set_alpha(0.5)
        else draw_set_alpha(1);
        }
    else draw_set_alpha(1);
        
    // Display debug data
    var str;//,mx,my; 
    str = "";
    //mx = round(device_mouse_raw_x(0));
    //my = round(device_mouse_raw_y(0));
    str += string(rfps_txt)+" RFPS\n";
    str += "S:"+string(global.step)+", I:"+string(instance_count)+"\n";
    str += string(fps)+" FPS";
    draw_text(xview+240,yview+290,str);
    /*draw_text(xview+240,yview+280,string(device_mouse_x(0)+", "+device_mouse_y(0)));
    draw_text(xview+240,yview+290,string(rfps_txt)+" RFPS");
    draw_text(xview+240,yview+300,"S:"+string(global.step)+", I:"+string(instance_count));
    draw_text(xview+240,yview+310,string(fps)+" FPS");*/
    }
    
if draw_get_alpha() == 0.5 then draw_set_alpha(1);