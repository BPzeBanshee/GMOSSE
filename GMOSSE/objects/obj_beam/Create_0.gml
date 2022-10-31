// todo: replace parent with obj_lasertarget or something similar
event_inherited();

// configurable variables
b_img = spr_beam;          // the beam itself
f_img = spr_beam_flash;    // the beginning of the beam
h_img = spr_beam_head;      // the end of the beam
b_spd = 4;
direction = 270;
image_xscale = 0;
image_angle = direction;

// image control vars, don't touch these
b_subimg = 0; b_alpha = 1;
f_subimg = 0; f_alpha = 1;
h_subimg = 0; h_alpha = 1;
b_subimg_max = sprite_get_number(b_img)-1;
f_subimg_max = sprite_get_number(f_img)-1;
h_subimg_max = sprite_get_number(h_img)-1;
b_width = sprite_get_width(b_img);
h_width = sprite_get_xoffset(h_img);

