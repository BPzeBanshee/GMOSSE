if !global.button1 ready = true;
if (global.button1 && ready && !instance_exists(obj_trans))
    {
    ready = false;
    instance_destroy();
    }
/*if (global.jleft && ready)
    {
    choice = 1;
    update_table();
    }
else if (global.jright && ready)
    {
    choice = 2;
    update_table();
    }*/