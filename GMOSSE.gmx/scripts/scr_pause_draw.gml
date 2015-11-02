/* 
scr_pause_draw()

CALL IN DRAW EVENT.

For drawing the 'background' - all the paused enemies and stuff.
accounts for offset and rotation position weirdness
(the latter being the reason for ie. +239 instead of +240
as covered by variable x/y_o2)
*/
if !sprite_exists(p) then exit;
/*s = 1;
if global.vbox_mode = 1
    {
    if global.win_size > 1
        {
        s = global.win_size/4;
        if global.surfaces = 1 then s = global.win_size/2;
        }
    else s = global.win_size;
    }*/

switch global.tate 
    {
    case 0: draw_sprite_ext(p,0,xview-x_o2+s2,yview-y_o2+s2,s,s,0,c_white,1); break;
    case 1: draw_sprite_ext(p,0,xview+240-x_o2+s2,yview-y_o2+s2,s,s,270,c_white,1); break;
    case 2: draw_sprite_ext(p,0,xview+240-x_o2+s2,yview+320-y_o2+s2,s,s,180,c_white,1); break;
    case 3: draw_sprite_ext(p,0,xview-x_o2+s2,yview+320-y_o2+s2,s,s,90,c_white,1); break;
    }
