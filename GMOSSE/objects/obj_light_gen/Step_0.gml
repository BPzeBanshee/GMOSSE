timer += 1;
if timer >= r3
    {
    instance_create_layer(xview+120,random_range(yview+80,yview+240),layer,obj_lightning);
    
    // "true random" lightning sound
    scr_stopsnd(snd);
    var r = random_range(1,3); 
    if round(r2) == round(r) then exit;
    if round(r) == 1 then snd = snd_lightning1;
    if round(r) == 2 then snd = snd_lightning2;
    if round(r) == 3 then snd = snd_lightning3;
    scr_playsnd(snd,1);
    r2 = r;
    
    // lightning flash
	layer_background_alpha(l2b,0.8);
    
    // reset timer, with a twist
    r3 = irandom_range(180,400);
    timer = 0;
    }
    
timer2 += 1;
if timer2 >= r4
    {
    instance_create_layer(xview+random_range(80,160),random_range(yview+40,yview+280),layer,obj_lightning2);
    r4 = irandom_range(80,240);
    timer2 = 0;
    }
    
// lightning flash fadeout
if layer_background_get_alpha(l2b) >= 0 then layer_background_alpha(l2b,layer_background_get_alpha(l2b)-0.02);

// fake parallax wobble scroll with layer 1
/*if global.button3 then s = global.slowshipspeed else s = global.shipspeed;
if (xview_last > xview) then layer_x(l2,layer_get_x(l2)-(xview_last-xview));
if (xview > xview_last) then layer_x(l2,layer_get_x(l2)+(xview-xview_last));
xview_last = xview;*/