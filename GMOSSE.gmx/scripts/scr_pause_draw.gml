/* 
scr_pause_draw()

CALL IN DRAW EVENT.

For drawing the 'background' - all the paused enemies and stuff.
accounts for offset and rotation position weirdness
(the latter being the reason for ie. +239 instead of +240
as covered by variable x/y_o2). 

Rotation may be changable via menu but as the picture doesn't change 
until you unpause/repause again neither does the offsets for drawing it, 
so we use tate_first as defined in scr_pause() rather than global.tate.
*/
if !sprite_exists(p) then exit;
switch tate_first
    {
    case 0: draw_sprite_ext(p,0,xview,yview,1,1,0,c_white,1); break;
    case 1: draw_sprite_ext(p,0,xview+240,yview,1,1,270,c_white,1); break;
    case 2: draw_sprite_ext(p,0,xview+240,yview+320,1,1,180,c_white,1); break;
    case 3: draw_sprite_ext(p,0,xview,yview+320,1,1,90,c_white,1); break;
    }
