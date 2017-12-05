/* INIT */
scr_draw_vars(global.fnt_default,fa_left,make_color_rgb(90,218,90));

/* SCORE */
draw_set_alpha(1);
if instance_exists(obj_player)
    {
    if obj_player.x < xview+64 && obj_player.y < yview+96//32 
    then draw_set_alpha(0.5);
    }
draw_text(xview+1,yview,string(score));
    
/* MULTIPLIER */
if global.chain > 0
    {
    chaincount = "x"+string(global.chain);
    draw_set_color(make_color_rgb(218,218,218));
    draw_text(xview+1,yview+35,chaincount);
    }
    
/* CHAIN TIMER */
if global.countdown < 90 then a -= 0.005 else a = 0.5;
draw_set_alpha(a); 
    
if instance_exists(obj_hitbox) && instance_exists(obj_player) then 
scr_draw_gauge(obj_hitbox.x,obj_hitbox.y,20,4,360+90,90,-1,(global.countdown/180)*100,c_blue,16777088);
    
/* LIVES DISPLAY */
a2 = 1;
if instance_exists(obj_player)
    {
    if obj_player.x < xview+64//32 
    && obj_player.y < yview+96//24 
    then a2 = 0.25;
    }
for (i=0;i<lives;i+=1)
    {
    k = sprite_get_width(spr_lives) * i;
    draw_sprite_ext(spr_lives,0,xview+5+k,yview+19,1,1,0,c_white,a2);
    }
    
/* BOMB DISPLAY */
a3 = 1;
if instance_exists(obj_player)
    {
    if obj_player.x < xview+120 
    && obj_player.y > yview+294 
    then a3 = 0.25;
    }
if global.shipselect = 3 && instance_exists(obj_player)
    {
    // Speed Level and Weapon Display
    var spd,op,md;
    spd = obj_player.speed_gear;
    if (obj_player.option1).program = 1 then md = "*" else md = "";
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
    draw_text(xview,yview+302,op + md);
    for (i=0;i<spd;i+=1)
        {
        k = sprite_get_width(spr_bh_spd) * i;
        draw_sprite_ext(spr_bh_spd,-1,xview+4+k,yview+316,1,1,0,c_white,a3);
        }
    }
else
    {
    // Bomb Display
    for (i=0;i<global.bombs;i+=1)
        {
        k = sprite_get_width(spr_bombs) * i;
        draw_sprite_ext(spr_bombs,0,xview+8+k,yview+312,1,1,0,c_white,a3);
        }
    }


