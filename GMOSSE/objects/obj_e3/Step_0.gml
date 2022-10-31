// Create feet and legs
if !made
    {
    var p = 0;
    event_user(0);
    for (var i=0;i<pairs;i+=1)
        {
        for (var j=0;j<=1;j+=1)
            {
            leg[i,j] = instance_create_layer(x,y,layer,obj_e_leg);
            foot[i,j] = instance_create_layer(pos[p,0],pos[p,1],layer,obj_e_foot);
            p += 1;
            }
        }
    made = true;
    }
    
if made
    {
    if timer > 0 then timer -= 1;
    if y >= 130 && timer == 0
        {
        timer = 60;
        
        // Set which feet to move
        // upper-left & lower-right
        // upper-right & lower-left
        var n1a,n1b,n2a,n2b,n3a,n3b;
        if b == 0
            {
            n1a = 0; n1b = 0;
            n2a = 1; n2b = 1;
            //n3a = 2; n3b = 0;
            b = 1;
            }
        else
            {
            n1a = 0; n1b = 1;
            n2a = 1; n2b = 0;
            //n3a = 2; n3b = 1;
            b = 0;
            }
            
        // Set new foot y positions to move up
        if moving == 1
            {
            foot[n1a,n1b].yy = foot[n1a,n1b].y - 64;
            foot[n2a,n2b].yy = foot[n2a,n2b].y - 64;
            //foot[n3a,n3b].yy = foot[n3a,n3b].y - 64;
            }
        else
            {
            foot[n1a,n1b].yy = foot[n1a,n1b].y - 32;
            foot[n2a,n2b].yy = foot[n2a,n2b].y - 32;
            //foot[n3a,n3b].yy = foot[n3a,n3b].y - 32;
            moving = 1;
            }
        
        // Set new foot x positions to move sideways
        if keyboard_check(ord("J")) && move_hori == 0 then move_hori = -1;
        if keyboard_check(ord("L")) && move_hori == 0 then move_hori = 1;
        if move_hori < 0
            {
            foot[n1a,n1b].xx = foot[n1a,n1b].x - 32;
            foot[n2a,n2b].xx = foot[n2a,n2b].x - 32;
            move_hori -= 1; if move_hori = -3 then move_hori = 0;
            }
        if move_hori > 0
            {
            foot[n1a,n1b].xx = foot[n1a,n1b].x + 32;
            foot[n2a,n2b].xx = foot[n2a,n2b].x + 32;
            move_hori += 1; if move_hori = 3 then move_hori = 0;
            }
        }
    
    var avg_x,avg_y;
    avg_x = 0; avg_y = 0;
    
    // Maintain Leg info
    for(var i=0;i<pairs;i+=1)
        {
        for (var j=0;j<=1;j+=1)
            {
            leg[i,j].x = x; leg[i,j].y = y;
            leg[i,j].direction = point_direction(leg[i,j].x,leg[i,j].y,foot[i,j].x,foot[i,j].y);
            leg[i,j].image_xscale = point_distance(leg[i,j].x,leg[i,j].y,foot[i,j].x,foot[i,j].y);
            foot[i,j].y += 0.5; foot[i,j].yy += 0.5; // fake yscroll for test
            avg_x += foot[i,j].x;
            avg_y += foot[i,j].y;
            }
        }
        
    // set center to average out of the foot positions
    x = avg_x / (pairs*2);
    y = avg_y / (pairs*2);
    }

