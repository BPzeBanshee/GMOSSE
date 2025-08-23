///@desc Draw with outline
/*draw_sprite_ext(spr_bh_out,-1,x,y,1,1,0,blend,1);
gpu_set_fog(true,blend,0,1);
draw_sprite_ext(sprite_index,image_index,x,y,1.1,1.1,image_angle,image_blend,image_alpha);
gpu_set_fog(false,c_white,0,1);*/
draw_sprite_ext(spr_bh_out,image_index,x,y,1,1,0,blend,outline_alpha);

draw_self();