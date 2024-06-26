function scr_hiscore_draw() {
	draw_set_alpha(1);
	draw_set_font(global.fnt_default);
	draw_set_color(c_white);

	var hgap,vgap,shipscale,shippos;
	hgap = 16;
	vgap = 24;
	shipscale = 0.8;
	shippos = 202;

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
    
	    switch ship_used
	        {
	        case 1: draw_sprite_ext(spr_xono,0,xview + hgap + shippos,yview + 32 + i + 24,shipscale,shipscale,0,c_white,1); break;
	        case 2: draw_sprite_ext(spr_warbird,1,xview + hgap + shippos,yview + 32 + i + 24,shipscale,shipscale,0,c_white,1); break;
	        case 3: draw_sprite_ext(spr_bh,0,xview + hgap + shippos,yview + 32 + i + 24,shipscale,shipscale,0,c_white,1); break;
	        case 4: draw_sprite_ext(spr_trident,2,xview + hgap + shippos,yview + 32 + i + 24,shipscale,shipscale,0,c_white,1); break;
	        case 5: draw_sprite_ext(spr_arxyne,0,xview + hgap + shippos,yview + 32 + i + 24,shipscale,shipscale,0,c_white,1); break;
	        default: break;
	        }
	    }
	}