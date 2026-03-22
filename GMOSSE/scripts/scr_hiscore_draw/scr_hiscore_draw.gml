function scr_hiscore_draw(){
	var hgap = 40;//14
	var vgap = 12;//was 12
	var start_y = yview+145;//170

	// rectangle background to make text more readable
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(xview+(hgap-10),start_y-20,xview+240-(hgap-10),start_y+(vgap*10)+5,0);
	draw_set_alpha(1);

	scr_draw_vars(global.fnt_default,fa_center,c_white);
	//var mode_txt = choice == 1 ? "NORMAL MODE" : "ARCADE MODE";
	//draw_text(xview+120,start_y,"HIGH SCORES");
	draw_sprite_ext(spr_highscores,0,xview+120,start_y-5,1,1,0,c_white,1);
	/*if choice == 1
	draw_sprite(spr_shipselect,-1,xview+240-40,yview+170)
	else draw_sprite_ext(spr_shipselect,-1,xview+40,yview+170,-1,1,0,c_white,1);*/
	
	var lvl_txt;
	for (var i=1;i<10;i+=1)
	    {
	    var ii = i*vgap;
		
		// format lvl into something more meaningful
		lvl_txt = string(lvl[i]);
		if lvl[i] == 6 lvl_txt = "ALL";
    
	    // entry number
	    draw_set_halign(fa_left);
	    draw_set_color(c_red);
	    var num = string(i);
	    draw_text(xview + hgap,start_y + ii,num);
    
	    // player name
	    draw_set_color(c_white);
	    var txt = name_location[i];
	    draw_text(xview + hgap + 10,start_y + ii,txt);
    
	    // stage reached
	    draw_set_color(c_lime);
	    draw_text(xview + hgap + 50,start_y + ii,lvl_txt);
    
	    // score
	    draw_set_halign(fa_right);
	    draw_set_color(c_yellow);
	    var txt2 = score_location[i];
	    draw_text((xview + 240) - hgap - 14,start_y + ii,txt2); 
		
		// ship used
		var ship_spr = spr_xono;
		switch ship_used[i]
			{
			case 1: break;
			case 2: ship_spr = spr_warbird; break;
			case 3: ship_spr = spr_bh; break;
			case 4: ship_spr = spr_trident; break;
			case 5: ship_spr = spr_arxyne; break;
			}
		draw_sprite_ext(ship_spr,2,(xview+240)-hgap-4,start_y+ii+5,0.25,0.25,0,c_white,1);
	    //draw_sprite(spr_lives,ship_used[i],(xview+240)-hgap-4,start_y+ii+5); // ship used
	    }
	}