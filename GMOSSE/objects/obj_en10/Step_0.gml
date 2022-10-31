if y > yview-(sprite_height/2) then timer += 1;
if timer > 60
    {
    direction += 2;
    if spd < 10 then spd += 0.25;
    if !made
        {
        for (var i=1;i<=16;i++) shot[i] = instance_create_layer(x,y,layer,obj_en10_orb);
        made = true;
        }
    else
        {
        var p = 1; 
        var q = 1;
        for (var i=1;i<=16;i++)
            {
            shot[i].x = x + lengthdir_x(spd*p,direction + (90*q));
            shot[i].y = y + lengthdir_y(spd*p,direction + (90*q));
            p += 1; 
            if p > 4 
                {
                p = 1; 
                q += 1;
                }
            }
        }
    }

