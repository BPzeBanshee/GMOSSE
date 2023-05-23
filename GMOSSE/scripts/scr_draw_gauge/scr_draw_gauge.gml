/// @desc scr_draw_gauge(x1,y1,r,width,start,end,dir,value,mincol,maxcol)
/// @param x1
/// @param y1
/// @param r
/// @param width
/// @param start
/// @param end
/// @param dir
/// @param value
/// @param mincol
/// @param maxcol
function scr_draw_gauge(x1,y1,r,w,v_st,v_en,v_dr,v_am,mincol,maxcol) {
	/*
	scr_draw_gauge, by SINAZ

	Purpose/Description:
	Draws a circular healthbar style guage with a center at x1,y1.

	It has an inner radius of r, and a width of width.  Start and end
	represent the angle at which the guage should start and end.
	Dir is the direction the guage increases (1 ccw, -1 cw).
	Value is the current value of the healthbar (between 0 and 100)
	and mincol and maxcol are the minimum and maximum value colors
	*/
	v_st += 360;
	v_en += 360;
	v_am *= 0.01;
	var forloopres = 10; // added in by BPzeBanshee, was originally hardcoded 10
	var v_dif_h,v_dif_s,v_dif_v,v_size;
	v_dif_h = color_get_hue(maxcol) - color_get_hue(mincol);
	v_dif_s = color_get_saturation(maxcol) - color_get_saturation(mincol);
	v_dif_v = color_get_value(maxcol) - color_get_value(mincol);

	if(v_am > 1) then v_am = 1;
	if(v_am < 0) then v_am = 0;

	switch (v_dr)
	    {
	    case -1:
	        {
	        if (v_en > v_st) then v_en -= 360;
	        break;
	        }
	    case 1:
	        {
	        if (v_en<v_st) then v_en+=360;
	        break;
	        }
	    }

	v_size = abs(v_st-v_en);

	gpu_set_blendmode(bm_add);
	draw_set_color(make_color_hsv(color_get_hue(mincol)+v_dif_h*v_am,color_get_saturation(mincol)+v_dif_s*v_am,color_get_value(mincol)+v_dif_v*v_am));
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(x1+lengthdir_x(r,v_st),y1+lengthdir_y(r,v_st));
	draw_vertex(x1+lengthdir_x(r+w,v_st),y1+lengthdir_y(r+w,v_st));
	for(var i=1; i<floor(v_size*v_am)/forloopres; i+=1)
	    {
	    draw_vertex(x1+lengthdir_x(r,v_st+i*forloopres*v_dr),y1+lengthdir_y(r,v_st+i*forloopres*v_dr));
	    draw_vertex(x1+lengthdir_x(r+w,v_st+i*forloopres*v_dr),y1+lengthdir_y(r+w,v_st+i*forloopres*v_dr));
	    }
	if(v_am > 0.98)
	    {
	    draw_vertex(x1+lengthdir_x(r,v_en),y1+lengthdir_y(r,v_en));
	    draw_vertex(x1+lengthdir_x(r+w,v_en),y1+lengthdir_y(r+w,v_en));
	    }
	else
	    {
	    draw_vertex(x1+lengthdir_x(r,v_st+v_size*v_am*v_dr),y1+lengthdir_y(r,v_st+v_size*v_am*v_dr));
	    draw_vertex(x1+lengthdir_x(r+w,v_st+v_size*v_am*v_dr),y1+lengthdir_y(r+w,v_st+v_size*v_am*v_dr));
	    }
	draw_primitive_end();
	draw_set_color(c_white);
	gpu_set_blendmode(bm_normal);
}