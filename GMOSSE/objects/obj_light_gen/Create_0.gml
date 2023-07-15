timer = 0; 
timer2 = 0;
r = random_range(0,3); 
r2 = r;
r3 = irandom_range(180,400);
r4 = irandom_range(80,240);
snd = snd_lightning1;

// TODO: did I have the light above the clouds or underneath?
l1 = layer_get_id("lay_bkg");
l2 = layer_get_id("lay_bkg2");
l1b = layer_background_get_id(l1);
l2b = layer_background_get_id(l2);
layer_background_alpha(l1b,0.5);
layer_background_sprite(l2b,bkg_light_gen);
layer_background_alpha(l2b,0);

//layer_background_blend(l1b,make_color_rgb(208,226,255)); // background_color didn't respect background_alpha
//xview_last = xview;