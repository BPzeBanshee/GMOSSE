function scr_hud_player(xx=xview,yy=yview, side=0) {
	// INIT //
	scr_draw_vars(global.fnt_default,(side ? fa_right : fa_left),make_color_rgb(90,218,90));
	var exists = instance_exists(myplayer);
	
	// SCORE //
	draw_set_alpha(1);
	if exists
	    {
		if myplayer.y < yy+96//32 
			{
		    if (side ? (myplayer.x > xx+240-64) : (myplayer.x < xx+64)) then draw_set_alpha(0.5);
			}
	    }
	draw_text(xx+(side ? 239 : 1),yy,string(myscore));
    
	// MULTIPLIER //
	if chain > 0
	    {
	    var chaincount = "x"+string(chain);
	    draw_set_color(make_color_rgb(218,218,218));
	    draw_text(xx+(side ? 239 : 1),yy+35,(chaincount));
	    }
    
	// CHAIN TIMER //
	if countdown < 90 then a -= 0.005 else a = 0.5;
	draw_set_alpha(a); 
    
	if countdown > 0 && instance_exists(myhitbox) && exists then 
	scr_draw_gauge(myhitbox.x,myhitbox.y,20,4,360+90,90,-1,(countdown/180)*100,c_blue,16777088);
    
	// LIVES DISPLAY //
	var a2 = 1;
	if exists
	    {
	    if myplayer.x < xx+(side ? 240-64 : 64)  
	    && myplayer.y < yy+96//24 
	    then a2 = 0.25;
	    }
	for (var i=0;i<mylives;i++)
	    {
	    var k = sprite_get_width(spr_lives) * i;
	    draw_sprite_ext(spr_lives,0,xx+(side ? 235-k : 5+k),yy+19,1,1,0,c_white,a2);
	    }
    
	// BOMB DISPLAY //
	var a3 = 1;
	if exists
	    {
	    if myplayer.y > yy+294
			{
			if (side ? (myplayer.x > xx+120) : (myplayer.x < xx+120))
			then a3 = 0.25;
			}
	    
		if global.shipselect[side] == 3
		    {
		    // Speed Level and Weapon Display
		    var op,md;
		    var spd = myplayer.speed_gear;
		    if (myplayer.option1).program == 1 then md = "*" else md = "";
		    switch global.optiontype[side]
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
		        draw_sprite_ext(spr_bh_spd,-1,(side ? xx+236-k : xx+4+k),yy+316,1,1,0,c_white,a3);
		        }
		    }
		else
		    {
		    // Bomb Display
		    for (var i=0;i<myplayer.bombs;i++)
		        {
		        var k = sprite_get_width(spr_bombs) * i;
		        draw_sprite_ext(spr_bombs,0,(side ? xx+232-k : xx+8+k),yy+312,1,1,0,c_white,a3);
		        }
		    }
	    }
	}