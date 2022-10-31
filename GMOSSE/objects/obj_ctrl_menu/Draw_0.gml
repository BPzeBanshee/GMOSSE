if !enabled then exit;
scr_draw_vars(global.fnt_menu,fa_center,8454016);
draw_set_alpha(1);

// Draw cursors
if selection == 1
    {
    if selection2 > 1 then 
    draw_sprite_ext(spr_shipselect,-1,35,147,-1,1,0,c_white,1);
    if selection2 < 3 then
    draw_sprite_ext(spr_shipselect,-1,205,147,1,1,0,c_white,1);
    }
else draw_set_color(c_green);

// Draw main menu
switch selection2
    {
    case 1: draw_text(120,140,"Start Game"); break;
    case 2: draw_text(120,140,"Start Boss Rush"); break;
    //case 3: draw_text(120,140,"Start Omake Rush"); break;
    case 3: draw_text(120,140,"Start Tutorial"); break;
    }

if selection == 2 draw_set_color(8454016) else draw_set_color(c_green);
draw_text(120,170,"Configure Options");
if selection == 3 draw_set_color(8454016) else draw_set_color(c_green);
draw_text(120,200,"Show Credits");
if selection == 4 draw_set_color(8454016) else draw_set_color(c_green);
draw_text(120,230,"Show Scores");
if selection == 5 draw_set_color(8454016) else draw_set_color(c_green);
draw_text(120,260,"Exit Game");

