if glow
	{
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(spr_bullet_glow,1,x,y,1,1,0,glowcolor,1);
	gpu_set_blendmode(bm_normal);
	}
draw_self();