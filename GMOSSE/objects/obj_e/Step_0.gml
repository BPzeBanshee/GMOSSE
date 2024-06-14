// Create feet and legs
if !made
    {
    leg[0] = instance_create_layer(x,y,layer,obj_e_leg); leg[0].direction = 45;
    leg[1] = instance_create_layer(x,y,layer,obj_e_leg); leg[1].direction = 45+90;
    leg[2] = instance_create_layer(x,y,layer,obj_e_leg); leg[2].direction = 45+180;
    leg[3] = instance_create_layer(x,y,layer,obj_e_leg); leg[3].direction = 45+270;
    leg[0].image_xscale = 64; 
	leg[1].image_xscale = 64; 
	leg[2].image_xscale = 64; 
	leg[3].image_xscale = 64;
    foot[0] = instance_create_layer(x-64,y-64,layer,obj_e_foot);
    foot[1] = instance_create_layer(x+64,y-32,layer,obj_e_foot);
    foot[2] = instance_create_layer(x-64,y+64,layer,obj_e_foot);
    foot[3] = instance_create_layer(x+64,y+32,layer,obj_e_foot);
    made = true;
    }
    
if made
    {
    // Maintain Leg info
    for(var i=0;i<=3;i++)
        {
        leg[i].x = x; 
		leg[i].y = y;
        leg[i].direction = point_direction(leg[i].x,leg[i].y,foot[i].x,foot[i].y);
        leg[i].image_xscale = point_distance(leg[i].x,leg[i].y,foot[i].x,foot[i].y);
        foot[i].y += 0.5; foot[i].yy += 0.5; // fake yscroll for test
        }
    x = (foot[0].x + foot[1].x + foot[2].x + foot[3].x) / 4;
    y = (foot[0].y + foot[1].y + foot[2].y + foot[3].y) / 4;
    //y += 0.5; // fake yscroll for test
    
    if timer > 0 timer -= 1;
    if y >= 130 && timer == 0
        {
        timer = 60;
        
        // Set which feet to move
        // upper-left & lower-right
        // upper-right & lower-left
        var n1,n2;
        if b == 0
            {
            n1 = 0; n2 = 3; b = 1;
            }
        else
            {
            n1 = 1; n2 = 2; b = 0;
            }
            
        // Set new foot y positions to move up
        foot[n1].yy = foot[n1].y - 64;
        foot[n2].yy = foot[n2].y - 64;
        
        // Set new foot x positions to move sideways
        if keyboard_check(ord("J")) && c == 0 c = 1;
        if keyboard_check(ord("L")) && d == 0 d = 1;
        if c > 0
            {
            foot[n1].xx = foot[n1].x - 32;
            foot[n2].xx = foot[n2].x - 32;
            c += 1; 
			if c == 3 c = 0;
            }
        if d > 0
            {
            foot[n1].xx = foot[n1].x + 32;
            foot[n2].xx = foot[n2].x + 32;
            d += 1; 
			if d == 3 d = 0;
            }
        }
    }

