function scr_hiscore_draw() {
	draw_set_alpha(1);
	draw_set_font(global.fnt_default);
	draw_set_color(c_white);

	var hgap = 16;
	var vgap = 24;
	var shipscale = 0.8;
	var shippos = 202;

	var place,name_location,lvl,ship_used,score_location,txt,txt2;
	for (var i=vgap; i<vgap*10; i+=vgap)
	    {
	    place = i/vgap;
	    name_location = string(global.hiscore[place,0]);
	    lvl = global.hiscore[place,1];
	    ship_used = global.hiscore[place,2];
	    score_location = string(global.hiscore[place,3]);
    
	    if lvl == 6 lvl = "ALL";
	    txt = string(place) + ": " + name_location + "   "+string(lvl);
	    txt2 = score_location;
    
	    draw_set_color(c_fuchsia);
	    draw_set_halign(fa_left);
	    draw_text(xview + hgap,(yview+32) + i + 24,(txt));
        
	    draw_set_halign(fa_right);
	    draw_set_color(c_lime);
	    draw_text((xview + 240) - hgap - 22,(yview+32) + i + 24,(txt2)); // score
    
		var spr = -1;
		var ind = 0;
	    switch ship_used
	        {
	        case 1: spr = spr_xono;				break;
	        case 2: spr = spr_warbird;			break;
	        case 3: spr = spr_bh;				break;
	        case 4: spr = spr_trident; ind = 2; break;
	        case 5: spr = spr_arxyne;			break;
	        default: break;
	        }
		draw_sprite_ext(spr,ind,xview + hgap + shippos,yview + 32 + i + 24,shipscale,shipscale,0,c_white,1);
	    }
	}