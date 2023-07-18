if instance_exists(enemy)
    {
    x = enemy.x;
    y = enemy.y;
    }
else instance_destroy();

if flash == 0
    {
    if image_alpha > 0.5 then image_alpha -= 0.05 else flash = 1;
    }
else
    {
    if image_alpha < 1 then image_alpha += 0.05 else flash = 0;
    }