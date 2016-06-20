/*
scr_tate_init(), by BPzeBanshee

Defines global vars for window width and height
as well as required x/y offsets depending on
global.tate value, for use later on in scr_screen_init().
*/

globalvar win_w,win_h,xview,yview,x_o,y_o,t_o;
t_o = 40;
switch global.tate
    {
    case 0:
    case 2:
        {
        win_w = 240; 
        win_h = 320; 
        x_o = 0; 
        y_o = 0;
        break;
        }
    case 1:
    case 3:
        {
        win_w = 320; 
        win_h = 240;
        x_o = t_o;
        y_o = -t_o;
        break;
        }
    }
