// aesthetics
var thr = scr_basicshot(x,y+sprite_height/2-5,layer,obj_en_thr,8,270);
thr.image_xscale = 6;
thr.image_yscale = 6;
thr.image_angle = random(360);
thr.depth = depth+1;

//if y < yview-(sprite_height/2) exit;

// update turret point vars
event_user(0);

// Pod creation
if !made
    {
	var b=0; 
    for (var i=0;i<=2;i+=1) 
        {
        for (var j=0;j<=m[i];j+=1) 
            {
            turret[i,j] = instance_create_depth(p[b,0],p[b,1],depth-1,p[b,2]);
            (turret[i,j]).active = 1;
            
            // set directions left or right depending on side of carrier
            if b == 0 || b == 2 || b == 4 
            then turret[i,j].direction = 180
            else turret[i,j].direction = 0;
            
            // pass through enemy to spawn for enemy spawners
            if p[b,2] == obj_en_spawner
                {
                dead[i,j] = 1;
                (turret[i,j]).spawn = spawner_en[b];
                }
            else dead[i,j] = 0;
            b += 1; // increment loop
            }
        }
        
    // create hitbox (top part of the carrier that can be killed by player)
    box = instance_create_layer(x,y-(sprite_height/2),layer,obj_cruiser_hitbox);
    box.parent = (self).id;
    made = 1;
    }    

// movement handling
if hscroll==1 then hspeed = layer_get_hspeed(l);
switch phase
    {
    case 1:
        {
        if y < yview-48 then y += 0.5 else y += 0.25;
        if made then if (dead[2,0]) && (dead[2,1]) then phase = 2;
        break;
        }
    case 2:
        {
        if y < yview+48 then y += 0.5 else y += 0.25;
        if (dead[1,0]) && (dead[1,1]) then phase = 3;
        break;
        }
    case 3:
        {
        if y < yview+160 then y += 0.5 else y += 0.25;
        break;
        }
    }

// Death handling
if y > yview+320+(sprite_height/2) then instance_destroy();
if !instance_exists(box) && made
    {
    // Set everything that's still alive red
    image_blend = c_red;
    for (var i=0;i<=2;i+=1) //turret[i]
        {
        for (var j=0;j<=m[i];j+=1) //turret[i,j]
            {
            if instance_exists(turret[i,j]) 
            then turret[i,j].image_blend = c_red;
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
    if image_blend != blend then 
    for (var i=0;i<=2;i+=1) //turret[i]
        {
        for (var j=0;j<=m[i];j+=1) //turret[i,j]
            {
            if instance_exists(turret[i,j]) && dead[i,j]
            then turret[i,j].image_blend = image_blend;
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
    for (var i=0;i<=2;i+=1) //turret[i]
        {
        for (var j=0;j<=m[i];j+=1) //turret[i,j]
            {
            if instance_exists(turret[i,j])
                {
                turret[i,j].x = p[b,0];
                turret[i,j].y = p[b,1];
                }
            else
                {
                turret[i,j] = instance_create_depth(p[b,0],p[b,1],depth-1,ctype);
                turret[i,j].visible = true;
                dead[i,j] = 1;
                }
            b += 1; // update totalnumber
            }
        }
    }

