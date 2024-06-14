/// @description  MAIN MENU
if image_index == image_number image_speed = 0;
if !scr_isonscreen()
    {
    image_xscale = 0.22;
    image_yscale = 0.22;
    direction = random(360);
    speed = random_range(0.1,1);
    image_index = 3;
    image_speed = 0;
    image_alpha = 0;
    x = xview+120;
    y = yview+160;
    }
else
    {
    speed += 0.1;
    if image_alpha < 1 image_alpha += 0.02;
	image_xscale *= (1+image_xscale/15);
	image_yscale *= (1+image_yscale/15);
    /*if image_xscale < 3
        {
        image_xscale += 0.02;
        image_yscale += 0.02;
        }*/
    }