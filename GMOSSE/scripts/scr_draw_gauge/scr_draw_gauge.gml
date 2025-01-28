/// @desc scr_draw_gauge(x1,y1,r,width,g_start,g_end,g_dir,value,mincol,maxcol)
/// @param x1
/// @param y1
/// @param r
/// @param width
/// @param g_start
/// @param g_end
/// @param g_dir
/// @param value
/// @param mincol
/// @param maxcol
/// @returns 0
function scr_draw_gauge(x1,y1,r,width,g_start,g_end,g_dir,value,mincol,maxcol) {
	/*
	scr_draw_gauge, by SINAZ

	Purpose/Description:
	Draws a circular healthbar style guage with a center at x1,y1.
	It has an inner radius of r, and a width of width.  
	
	Start and end represent the angle at which the gauge should start and end.
	
	Dir is the direction the gauge increases (1 ccw, -1 cw).
	
	Value is the current value of the healthbar (between 0 and 100)
	and mincol and maxcol are the minimum and maximum value colors.
	*/
	g_start += 360;
	g_end += 360;
	value *= 0.01;
	var forloopres = 10; // added in by BPzeBanshee, was originally hardcoded 10
	var v_dif_h = color_get_hue(maxcol) - color_get_hue(mincol);
	var v_dif_s = color_get_saturation(maxcol) - color_get_saturation(mincol);
	var v_dif_v = color_get_value(maxcol) - color_get_value(mincol);

	value = clamp(value,0,1);

	switch (g_dir)
	    {
	    case -1:
	        {
	        if (g_end > g_start) g_end -= 360;
	        break;
	        }
	    case 1:
	        {
	        if (g_end < g_start) g_end += 360;
	        break;
	        }
	    }

	var v_size = abs(g_start-g_end);

	gpu_set_blendmode(bm_add);
	draw_set_color(make_color_hsv(color_get_hue(mincol)+v_dif_h*value,color_get_saturation(mincol)+v_dif_s*value,color_get_value(mincol)+v_dif_v*value));
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(x1+lengthdir_x(r,g_start),y1+lengthdir_y(r,g_start));
	draw_vertex(x1+lengthdir_x(r+width,g_start),y1+lengthdir_y(r+width,g_start));
	for(var i=1; i<floor(v_size*value)/forloopres; i+=1)
	    {
	    draw_vertex(x1+lengthdir_x(r,g_start+i*forloopres*g_dir),y1+lengthdir_y(r,g_start+i*forloopres*g_dir));
	    draw_vertex(x1+lengthdir_x(r+width,g_start+i*forloopres*g_dir),y1+lengthdir_y(r+width,g_start+i*forloopres*g_dir));
	    }
	if(value > 0.98)
	    {
	    draw_vertex(x1+lengthdir_x(r,g_end),y1+lengthdir_y(r,g_end));
	    draw_vertex(x1+lengthdir_x(r+width,g_end),y1+lengthdir_y(r+width,g_end));
	    }
	else
	    {
	    draw_vertex(x1+lengthdir_x(r,g_start+v_size*value*g_dir),y1+lengthdir_y(r,g_start+v_size*value*g_dir));
	    draw_vertex(x1+lengthdir_x(r+width,g_start+v_size*value*g_dir),y1+lengthdir_y(r+width,g_start+v_size*value*g_dir));
	    }
	draw_primitive_end();
	draw_set_color(c_white);
	gpu_set_blendmode(bm_normal);
	return 0;
}