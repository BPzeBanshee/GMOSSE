scr_draw_vars(global.fnt_default,fa_left,c_black);


var base_x = xview+25;
var base_y = yview+133;
var left_text = base_x+35; //xview+60
var right_text = left_text+80;
var cg = 8454016;//make_color_rgb(90,218,90);

// draw background piece
draw_set_alpha(0.75);
//var s = yview+133;//125 // base position for menu
//draw_rectangle(xview+25,s-8,xview+215,s+(g*(selection_max+3))+max_h,0);
draw_rectangle(base_x,base_y-8,base_x+190,base_y+(10*(selection_max+3))+8,false);
draw_set_alpha(1);
draw_set_color(c_white);

// text
if menu == 1
	{
	draw_text(left_text,base_y,"KEY REBINDS");
	
	draw_set_color(cg);
	draw_text(left_text,base_y+10,"UP: ");
	draw_text(left_text,base_y+20,"DOWN: ");
	draw_text(left_text,base_y+30,"LEFT: ");
	draw_text(left_text,base_y+40,"RIGHT: ");
	draw_text(left_text,base_y+50,"FIRE: ");
	draw_text(left_text,base_y+60,"BOMB: ");
	draw_text(left_text,base_y+70,"FOCUS: ");
	draw_text(left_text,base_y+80,"PAUSE: ");
	draw_text(left_text,base_y+100,"PREVIOUS MENU");
	
	draw_text(right_text,base_y+10,	scr_get_key_name(global.keycode_up));
	draw_text(right_text,base_y+20,	scr_get_key_name(global.keycode_down));
	draw_text(right_text,base_y+30,	scr_get_key_name(global.keycode_left));
	draw_text(right_text,base_y+40,	scr_get_key_name(global.keycode_right));
	draw_text(right_text,base_y+50,	scr_get_key_name(global.keycode_button1));
	draw_text(right_text,base_y+60,	scr_get_key_name(global.keycode_button2));
	draw_text(right_text,base_y+70,	scr_get_key_name(global.keycode_button3));
	draw_text(right_text,base_y+80,	scr_get_key_name(global.keycode_button4));
	
	if msg != "" 
		{
		draw_set_color(c_black);
		draw_set_alpha(0.75);
		draw_rectangle(base_x,base_y+120,base_x+190,base_y+140+string_height(msg),false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_text(left_text,base_y+130,msg);
		}
	}
	
if menu == 2
	{
	if array_length(new_id)>0
		{
		draw_text(left_text,base_y,"SELECT GAMEPAD ID:");
		var count = 0;
		for (var i=0;i<array_length(new_id);i++)
			{
			draw_text(left_text,base_y+(10*(i+1)),"ID "+string(i)+": "+new_str[i]);
			count++;
			}
		draw_text(left_text,base_y+10+(10*count),"PREVIOUS MENU");
		}
	else
		{
		draw_text(left_text,base_y,"NO GAMEPAD DETECTED!");
		}
	}
	
if menu == 3
	{
	draw_text(left_text,base_y,"GAMEPAD REBIND");
	draw_set_color(cg);
	
	draw_text(left_text,base_y+10,"FIRE: ");
	draw_text(left_text,base_y+20,"BOMB: ");
	draw_text(left_text,base_y+30,"FOCUS: ");
	draw_text(left_text,base_y+40,"PAUSE: ");
	draw_text(left_text,base_y+60,"PREVIOUS MENU");
	
	draw_text(right_text,base_y,	scr_get_pad_button_name(global.joy1));
	draw_text(right_text,base_y+10,	scr_get_pad_button_name(global.joy2));
	draw_text(right_text,base_y+20,	scr_get_pad_button_name(global.joy3));
	draw_text(right_text,base_y+30,	scr_get_pad_button_name(global.joy4));
	
	if msg != "" 
		{
		draw_set_color(c_black);
		draw_set_alpha(0.75);
		draw_rectangle(base_x,base_y+70,base_x+190,base_y+90+string_height(msg),false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_text(left_text,base_y+80,msg);
		}
	}
	
draw_sprite(spr_shipselect,-1,left_text-16,base_y+15+(10*selection)+(selection==selection_max?10:0));