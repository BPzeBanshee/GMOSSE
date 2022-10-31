// Array storing maximum amount of values in p[x]
//p[0] = top, p[1] = middle, p[2] = bottom
//p[side,0] = x, p[side,1] = y, p[side,2] = enemy object
m[0]=1; m[1]=1; m[2]=1;

p[0,0] = x - 40;     p[0,1] = y - 96;       
p[1,0] = x + 40;     p[1,1] = y - 96;
       
p[2,0] = x - 40;     p[2,1] = y;            
p[3,0] = x + 40;     p[3,1] = y;      
      
p[4,0] = x - 40;     p[4,1] = y + 96;       
p[5,0] = x + 40;     p[5,1] = y + 96;       

