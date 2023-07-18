// Create feet and legs
if !made
    {
    var p = 0;
    event_user(0);
    for (var i=0;i<=2;i++)
        {
        for (var j=0;j<=1;j++)
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
    // Maintain Leg info
    var yscroll;
    if spd_y == 0 then yscroll = true else yscroll = false; // spd_y is a globalvar declared by scr_camera_init iirc
    for(var i=0;i<=2;i+=1)
        {
        for (var j=0;j<=1;j+=1)
            {
            leg[i,j].x = x; leg[i,j].y = y;
            leg[i,j].direction = point_direction(leg[i,j].x,leg[i,j].y,foot[i,j].x,foot[i,j].y);
            leg[i,j].image_xscale = point_distance(leg[i,j].x,leg[i,j].y,foot[i,j].x,foot[i,j].y);
            if yscroll {foot[i,j].y += 0.5; foot[i,j].yy += 0.5;} // fake yscroll for test
            }
        }
        
    // set center to average out of the foot positions
    x = (foot[0,0].x+foot[0,1].x+foot[1,0].x+foot[1,1].x+foot[2,0].x+foot[2,1].x) / 6;
    y = (foot[0,0].y+foot[0,1].y+foot[1,0].y+foot[1,1].y+foot[2,0].y+foot[2,1].y) / 6;

    
    if timer > 0 then timer -= 1;
    if y >= yview+130 && timer == 0
        {
        timer = 60;
        
        // Set which feet to move
        // upper-left & lower-right
        // upper-right & lower-left
        var n1a,n1b,n2a,n2b,n3a,n3b;
        if b = 0
            {
            n1a = 0; n1b = 0;
            n2a = 1; n2b = 1;
            n3a = 2; n3b = 0;
            b = 1;
            }
        else
            {
            n1a = 0; n1b = 1;
            n2a = 1; n2b = 0;
            n3a = 2; n3b = 1;
            b = 0;
            }
            
        // Set new foot y positions to move up
        foot[n1a,n1b].yy = foot[n1a,n1b].y - 64;
        foot[n2a,n2b].yy = foot[n2a,n2b].y - 64;
        foot[n3a,n3b].yy = foot[n3a,n3b].y - 64;
        
        // Set new foot x positions to move sideways
        if keyboard_check(ord("J")) && c == 0 then c = 1;
        if keyboard_check(ord("L")) && d == 0 then d = 1;
        if c > 0
            {
            foot[n1a,n1b].xx = foot[n1a,n1b].x - 32;
            foot[n2a,n2b].xx = foot[n2a,n2b].x - 32;
            foot[n3a,n3b].xx = foot[n3a,n3b].x - 32;
            c += 1; if c == 3 then c = 0;
            }
        if d > 0
            {
            foot[n1a,n1b].xx = foot[n1a,n1b].x + 32;
            foot[n2a,n2b].xx = foot[n2a,n2b].x + 32;
            foot[n3a,n3b].xx = foot[n3a,n3b].x + 32;
            d += 1; if d == 3 then d = 0;
            }
        }
    }

