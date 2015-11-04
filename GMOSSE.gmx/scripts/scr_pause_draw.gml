/* 
scr_pause_draw()

CALL IN DRAW EVENT.

For drawing the 'background' - all the paused enemies and stuff.
accounts for offset and rotation position weirdness
(the latter being the reason for ie. +239 instead of +240
as covered by variable x/y_o2)
*/
if !sprite_exists(p) then exit;
s = 1/global.win_size;
switch global.tate 
    {
    case 0: draw_sprite_ext(p,0,xview,yview,s,s,0,c_white,1); break;
    case 1: draw_sprite_ext(p,0,xview+240,yview,s,s,270,c_white,1); break;
    case 2: draw_sprite_ext(p,0,xview+240,yview+320,s,s,180,c_white,1); break;
    case 3: draw_sprite_ext(p,0,xview,yview+320,s,s,90,c_white,1); break;
    }
