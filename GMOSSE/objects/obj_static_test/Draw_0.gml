x = xview;
y = yview;

event_user(0);
if surface_exists(surf) for (var i=0;i<320;i++)
    {
    draw_surface_part(surf,0,i,240,1,x+random_range(-alarm[0],alarm[0]),y+i);
    }

