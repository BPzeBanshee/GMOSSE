globalvar win_w,win_h,xview,yview,x_o,y_o,x_o2,y_o2;
switch global.tate
    {
    case 0: 
        {
        win_w = 240; 
        win_h = 320; 
        x_o = 0; 
        y_o = 0;
        x_o2 = 0;
        y_o2 = 0;
        break;
        }
    case 1:
        {
        win_w = 320; 
        win_h = 240;
        x_o = 41; 
        y_o = -40;
        x_o2 = 1;
        y_o2 = 0;
        break;
        }
    case 2:
        {
        win_w = 240; 
        win_h = 320;
        x_o = 1;
        y_o = 1;
        x_o2 = 1;
        y_o2 = 1;
        break;
        }
    case 3:
        {
        win_w = 320; 
        win_h = 240;
        x_o = 40; 
        y_o = -39;
        x_o2 = 0;
        y_o2 = 1;
        break;
        }
    }
