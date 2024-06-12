if mode == 1
    {
    if left_piece.x == 120 && right_piece.x == 120
        {
        if c < 1 then c += 0.035 else
            {
            instance_destroy(left_piece); 
            instance_destroy(right_piece);
            instance_create_layer(119,75,layer,obj_title);
            warpgen.visible = true;
            with obj_warp visible = true;
            with obj_star visible = true;
            mode = 2;
            }
        }
    }
else
    {
    if c > 0 then c -= 0.035 else timer += 1;
    /*if timer == 600
        {
        instance_create_layer(0,0,layer,obj_ctrl_attract); // start attract mode, leave room
        }
    if global.button1 && timer < 600
        {
        instance_create_layer(0,0,layer,obj_ctrl_menu);
        global.intro = false;
        instance_destroy();
        }*/
    }

