/*
scr_draw_gauge, by SINAZ

Purpose/Description:
Draws a circular healthbar style guage with a center at x1,y1.

Usage:
scr_draw_gauge(x1,y1,r,width,start,end,dir,value,mincol,maxcol)

It has an inner radius of r, and a width of width.  Start and end
represent the angle at which the guage should start and end.
Dir is the direction the guage increases (1 ccw, -1 cw).
Value is the current value of the healthbar (between 0 and 100)
and mincol and maxcol are the minimum and maximum value colors
*/

var x1,y1,r,w,v_st,v_en,v_dr,v_am,mincol,maxcol,v_dif_h,v_dif_s,v_dif_v,v_size;
x1 = argument0;
y1 = argument1;
r = argument2;
w = argument3;
v_st = argument4 + 360;
v_en = argument5 + 360;
v_dr = argument6;
v_am = argument7 * .01;
mincol = argument8;
maxcol = argument9;
forloopres = 10; // added in by BPzeBanshee, was originally hardcoded 10
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

v_size=abs(v_st-v_en);

draw_set_blend_mode(bm_add);
draw_set_color(make_color_hsv(color_get_hue(mincol)+v_dif_h*v_am,color_get_saturation(mincol)+v_dif_s*v_am,color_get_value(mincol)+v_dif_v*v_am));
draw_primitive_begin(pr_trianglestrip);
draw_vertex(x1+lengthdir_x(r,v_st),y1+lengthdir_y(r,v_st));
draw_vertex(x1+lengthdir_x(r+w,v_st),y1+lengthdir_y(r+w,v_st));
for(i=1;i<floor(v_size*v_am)/forloopres;i+=1)
{
 draw_vertex(x1+lengthdir_x(r,v_st+i*forloopres*v_dr),y1+lengthdir_y(r,v_st+i*forloopres*v_dr));
 draw_vertex(x1+lengthdir_x(r+w,v_st+i*forloopres*v_dr),y1+lengthdir_y(r+w,v_st+i*forloopres*v_dr));
}
if(v_am>.98)
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
draw_set_blend_mode(bm_normal);
