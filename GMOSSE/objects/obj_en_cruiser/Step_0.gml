// aesthetics
var thr = scr_basicshot(x,y+sprite_height/2-5,layer,obj_en_thr,8,270);
thr.image_xscale = 6;
thr.image_yscale = 6;
thr.image_angle = random(360);
thr.depth = depth+1;

// update turret point vars
event_user(0);

// Pod creation
if !made
    {
	var b = 0; 
    for (var yy=0; yy<3; yy++) 
        {
        for (var xx=0; xx<2; xx++) 
            {
            var t = instance_create_depth(p[b,0],p[b,1],depth-1,p[b,2]);
            t.active = true;
            
            // set directions left or right depending on side of carrier
			// if xx == 0 then value=180 else value=0
            t.direction = xx == 0 ? 180 : 0;
            
            // pass through enemy to spawn for enemy spawners
            if p[b,2] == obj_en_spawner
                {
                dead[xx,yy] = true;
                t.spawn = spawner_en[b];
                }
            else dead[xx,yy] = false;
			
			turret[xx,yy] = t;
            b += 1; // increment loop
            }
        }
        
    // create hitbox (top part of the carrier that can be killed by player)
    box = instance_create_layer(x,y-(sprite_height/2),layer,obj_cruiser_hitbox);
    box.parent_id = id;
    made = true;
    }    

// movement handling
if hscroll == true hspeed = layer_get_hspeed(l);
switch phase
    {
    case 1:
        {
        if y < yview-48 y += 0.5 else y += 0.25;
        if made if (dead[0,2]) && (dead[1,2]) phase = 2;
        break;
        }
    case 2:
        {
        if y < yview+48 y += 0.5 else y += 0.25;
        if (dead[0,1]) && (dead[1,1]) phase = 3;
        break;
        }
    case 3:
        {
        if y < yview+160 y += 0.5 else y += 0.25;
        break;
        }
    }

// Death handling
if y > yview+320+(sprite_height/2) instance_destroy();
if !instance_exists(box) && made
    {
    // Set everything that's still alive red
    image_blend = c_red;
    for (var yy=0; yy<3; yy++)
        {
        for (var xx=0; xx<2; xx++)
            {
            if instance_exists(turret[xx,yy]) turret[xx,yy].image_blend = c_red;
            }
        }
        
    // explosion + limit explosion sfx
    instance_create_layer(x+random_range(-75,75),y+random_range(-168,168),layer,obj_explosion);
    if exptimer == 0
        {
        scr_snd_play(snd_exp1,true);
        exptimer = 5;
        }
    exptimer -= 1;
    
    // move down and die
    vspeed += 0.05;
    }
else // if still alive
    {
    if !made exit;
    // set craters to colour of ship if ship colour has changed
    if image_blend != blend 
    for (var yy=0; yy<3; yy++) //turret[i]
        {
        for (var xx=0; xx<2; xx++) //turret[i,j]
            {
            if instance_exists(turret[xx,yy]) && dead[xx,yy]
            turret[xx,yy].image_blend = image_blend;
            }
        }
    blend = image_blend;
    }
    
// MOVEMENT COMPLETE - SYNC EVERYTHING ELSE TO ITS POSITION
if made
    {
    if instance_exists(box) // update hitbox
        {
        box.x = x;
        box.y = y-sprite_height/2;
        }
    
    var b = 0;
	var ctype = obj_crater4;
    for (var yy=0; yy<3; yy++)
        {
        for (var xx=0; xx<2; xx++)
            {
            if instance_exists(turret[xx,yy])
                {
                turret[xx,yy].x = p[b,0];
                turret[xx,yy].y = p[b,1];
                }
            else
                {
                turret[xx,yy] = instance_create_depth(p[b,0],p[b,1],depth-1,ctype);
                turret[xx,yy].visible = true;
                dead[xx,yy] = true;
                }
            b += 1; // update totalnumber
            }
        }
    }

