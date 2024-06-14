if !enabled exit;
scr_draw_vars(global.fnt_menu,fa_center,8454016);
var bx = room_width/2; // 240/2 == 120
var by = 140;
draw_set_alpha(1);

// Draw cursors
if selection == 1
    {
    if selection2 > 1 
    draw_sprite_ext(spr_shipselect,-1,bx-85,by+7,-1,1,0,c_white,1);
    if selection2 < 3
    draw_sprite_ext(spr_shipselect,-1,bx+85,by+7,1,1,0,c_white,1);
    }
else draw_set_color(c_green);

// Draw main menu
var game_str = "Start Game";
switch selection2
    {
    default: break;
    case 2: game_str = "Start Boss Rush"; break;
    case 3: game_str = "Start Tutorial"; break;
	//case 3: game_str = "Start Omake Rush"; break;
    }
draw_text(bx,by,game_str);

if selection == 2 draw_set_color(8454016) else draw_set_color(c_green);
draw_text(bx,by+30,"Configure Options");
if selection == 3 draw_set_color(8454016) else draw_set_color(c_green);
draw_text(bx,by+60,"Show Credits");
if selection == 4 draw_set_color(8454016) else draw_set_color(c_green);
draw_text(bx,by+90,"Show Scores");
if selection == 5 draw_set_color(8454016) else draw_set_color(c_green);
draw_text(bx,by+120,"Exit Game");