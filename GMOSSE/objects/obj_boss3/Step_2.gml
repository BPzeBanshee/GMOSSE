event_user(0);
// debug test code
//if y > yview+(sprite_height/2) then speed=0;
if keyboard_check(ord("J")) {speed = 1; direction=180;}
if keyboard_check(ord("L")) {speed = 1; direction=0;}
if keyboard_check(ord("K")) {speed = 1; direction=270;}
if keyboard_check(ord("I")) {speed = 1; direction=90;}
if keyboard_check(vk_space) speed = 0;
if !made
    {
    var b = 0; 
    for (var i=0; i<=2; i++) 
        {
        for (var j=0; j<=m[i]; j++) 
            {
            turret[i,j]=instance_create_depth(p[b,0],p[b,1],depth-1,p[b,2]);
            turret[i,j].active = false;
            b += 1;
            }
        }
    made = true;
    }
    
if made
    {
    var b = 0;
    for (var i=0; i<=2; i++) //turret[i]
        {
        for (var j=0; j<=m[i]; j++) //turret[i,j]
            {
            if instance_exists(turret[i,j])
                {
                turret[i,j].x = p[b,0];
                turret[i,j].y = p[b,1];
                }
            else
                {
                var ctype = obj_crater;
                //if p[b,2] == obj_en_tur1 then ctype = obj_crater;
                if p[b,2] == obj_en_tur2 then ctype = obj_crater2;
                if p[b,2] == obj_en_tur3 then ctype = obj_crater3;
                turret[i,j] = instance_create_depth(p[b,0],p[b,1],depth-1,ctype);
                }
            b += 1; // update totalnumber
            }
        }
    }

    

if keyboard_check_pressed(vk_alt)
    {
    for (var i=0;i<=2;i++) 
		{
		for (var j=0;j<=m[i];j++) turret[i,j].active = true;
		}
    }

