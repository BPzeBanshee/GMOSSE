draw_set_alpha(0.5);

if instance_exists(boss)
    {
    // percentage of boss health to draw
    var percent = ( (boss).enemyHP / (boss).enemyHP_max ) * 100;
    
    if !init
        {
        // this is here for the "filling up" effect seen when making the healthbar
        min_hp += 2.4;
        if min_hp >= percent
            {
            min_hp = percent;
            init = true;
            }
        draw_healthbar(xview,yview+29,xview+240,yview+34,min_hp,-1,255,65280,0,0,0);
        }
    else draw_healthbar(xview,yview+29,xview+240,yview+34,percent,-1,255,65280,0,0,0);
    
    if global.debug && (boss).timeout > 0
        {
        draw_set_font(global.fnt_little);
        draw_set_halign(fa_left);
        draw_set_color(make_color_rgb(90,218,90));
        draw_set_alpha(1);
        draw_text(xview,yview+50,"Time Left: "+string((boss).timeout));
        }
    }
else instance_destroy();

