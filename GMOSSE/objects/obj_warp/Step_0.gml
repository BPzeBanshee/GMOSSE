scale *= (1+scale/20);
image_angle += 2;
if scale < 4 && alpha < 1 alpha += 0.0075;
if scale > 4
    {
    alpha -= 0.05;
    if alpha < 0.05 instance_destroy();
    }