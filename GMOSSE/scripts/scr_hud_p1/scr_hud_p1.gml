function scr_hud_p1(xx=xview,yy=yview) {
	/* INIT */
	scr_draw_vars(global.fnt_default,fa_left,make_color_rgb(90,218,90));
	var exists = instance_exists(myplayer);
	
	/* SCORE */
	draw_set_alpha(1);
	if exists
	    {
	    if myplayer.x < xx+64 && myplayer.y < yy+96//32 
	    then draw_set_alpha(0.5);
	    }
	draw_text(xx+1,yy,string(global.myscore));
    
	/* MULTIPLIER */
	if global.chain > 0
	    {
	    var chaincount = "x"+string(global.chain);
	    draw_set_color(make_color_rgb(218,218,218));
	    draw_text(xx+1,yy+35,(chaincount));
	    }
    
	/* CHAIN TIMER */
	if global.countdown < 90 then a -= 0.005 else a = 0.5;
	draw_set_alpha(a); 
    
	if global.countdown > 0 && instance_exists(myhitbox) && exists then 
	scr_draw_gauge(myhitbox.x,myhitbox.y,20,4,360+90,90,-1,(global.countdown/180)*100,c_blue,16777088);
    
	/* LIVES DISPLAY */
	var a2 = 1;
	if exists
	    {
	    if myplayer.x < xx+64//32 
	    && myplayer.y < yy+96//24 
	    then a2 = 0.25;
	    }
	for (var i=0;i<lives;i++)
	    {
	    var k = sprite_get_width(spr_lives) * i;
	    draw_sprite_ext(spr_lives,0,xx+5+k,yy+19,1,1,0,c_white,a2);
	    }
    
	/* BOMB DISPLAY */
	var a3 = 1;
	if exists
	    {
	    if myplayer.x < xx+120 
	    && myplayer.y > yy+294 
	    then a3 = 0.25;
		
		if global.shipselect == 3
		    {
		    // Speed Level and Weapon Display
		    var op,md;
		    var spd = myplayer.speed_gear;
		    if (myplayer.option1).program == 1 then md = "*" else md = "";
		    switch global.optiontype
		        {
		        default: op = "NORMAL"; break;
		        case 2: op = "REVERSE"; break;
		        case 3: op = "SEARCH"; break;
		        case 4: op = "MULTI"; break;
		        case 5: op = "MULTI-R"; break;
		        case 6: op = "SHADOW"; break;
		        case 7: op = "ROLL"; break;
		        }
		    draw_set_color(make_color_rgb(90,218,90));
		    draw_set_alpha(a3);
		    draw_text(xx,yy+302,op + md);
		    for (var i=0;i<spd;i++)
		        {
		        var k = sprite_get_width(spr_bh_spd) * i;
		        draw_sprite_ext(spr_bh_spd,-1,xx+4+k,yy+316,1,1,0,c_white,a3);
		        }
		    }
		else
		    {
		    // Bomb Display
		    for (var i=0;i<myplayer.bombs;i++)
		        {
		        var k = sprite_get_width(spr_bombs) * i;
		        draw_sprite_ext(spr_bombs,0,xx+8+k,yy+312,1,1,0,c_white,a3);
		        }
		    }
	    }
	}