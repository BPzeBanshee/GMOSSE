/// @description  MAIN MENU
if image_index = image_number then image_speed = 0;
if !scr_isonscreen()
    {
    image_xscale = 0;
    image_yscale = 0;
    direction = random(360);
    speed = random_range(0.1,1);
    //speed = random_range(2,15);
    image_index = 3;
    image_speed = 0;
    image_alpha = 0;
    x = xview+120;
    y = yview+160;
    }
else
    {
    speed += 0.1;
    if image_alpha < 1 then image_alpha += 0.01;
    if image_xscale < 3
        {
        image_xscale += 0.02;
        image_yscale += 0.02;
        }
    //direction += 2.5;
    }

