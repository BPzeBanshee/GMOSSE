if room != rm_menu
    {
    timer = 0;
    with obj_hitbox invincible = -999; // HACK to keep things interesting
    //random_set_seed(replay[#stagenum,1]);
    }
else
    {
    with obj_ctrl_input enabled = 1;
    instance_destroy();
    }

