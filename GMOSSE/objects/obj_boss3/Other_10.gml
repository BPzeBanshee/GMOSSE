// Array storing maximum amount of values in p[x]
//p[0] = center, p[1] = left side, p[2] = right side
//p[side,0] = x, p[side,1] = y, p[side,2] = enemy object
m[0]=4; m[1]=22; m[2]=22;

p[0,0] = x;     p[0,1] = y;         p[0,2] = obj_en_tur1;
p[1,0] = x;     p[1,1] = y-112;     p[1,2] = obj_en_tur2;
p[2,0] = x;     p[2,1] = y-159;     p[2,2] = obj_en_tur2;
p[3,0] = x;     p[3,1] = y+50;      p[3,2] = obj_en_tur1;
p[4,0] = x;     p[4,1] = y+100;     p[4,2] = obj_en_tur3;

p[5,0] = x-50;  p[5,1] = y-140;     p[5,2] = obj_en_tur1;
p[6,0] = x-55;  p[6,1] = y-90;      p[6,2] = obj_en_tur1;
p[7,0] = x-55;  p[7,1] = y-50;      p[7,2] = obj_en_tur3;
p[8,0] = x-55;  p[8,1] = y-26;      p[8,2] = obj_en_tur3;
p[9,0] = x-67;  p[9,1] = y-5;       p[9,2] = obj_en_tur3;
p[10,0]= x-40;  p[10,1]= y+80;      p[10,2]= obj_en_tur3;
p[11,0]= x-47;  p[11,1]= y+106;     p[11,2]= obj_en_tur3;
p[12,0]= x-23;  p[12,1]= y+106;     p[12,2]= obj_en_tur3;
p[13,0]= x-74;  p[13,1]= y+145;     p[13,2]= obj_en_tur1;
p[14,0]= x-125; p[14,1]= y+155;     p[14,2]= obj_en_tur3;
p[15,0]= x-148; p[15,1]= y+162;     p[15,2]= obj_en_tur3;
p[16,0]= x-171; p[16,1]= y+170;     p[16,2]= obj_en_tur3;
p[17,0]= x-95;  p[17,1]= y+20;      p[17,2]= obj_en_tur3;
p[18,0]= x-95;  p[18,1]= y-5;       p[18,2]= obj_en_tur3;
p[19,0]= x-95;  p[19,1]= y-35;      p[19,2]= obj_en_tur3;
p[20,0]= x-95;  p[20,1]= y-65;      p[20,2]= obj_en_tur3;
p[21,0]= x-110; p[21,1]= y-140;     p[21,2]= obj_en_tur1;
p[22,0]= x-100; p[22,1]= y-100;     p[22,2]= obj_en_tur3;
p[23,0]= x-130; p[23,1]= y-104;     p[23,2]= obj_en_tur3;
p[24,0]= x-160; p[24,1]= y-110;     p[24,2]= obj_en_tur3;
p[25,0]= x-190; p[25,1]= y-130;     p[25,2]= obj_en_tur3;
p[26,0]= x-240; p[26,1]= y-140;     p[26,2]= obj_en_tur3;
p[27,0]= x-306; p[27,1]= y-179;     p[27,2]= obj_en_tur3;

p[28,0]= x+50;  p[28,1] = y-140;    p[28,2]= obj_en_tur1;  
p[29,0]= x+55;  p[29,1] = y-90;     p[29,2]= obj_en_tur1;
p[30,0]= x+55;  p[30,1] = y-50;     p[30,2]= obj_en_tur3;
p[31,0]= x+55;  p[31,1] = y-26;     p[31,2]= obj_en_tur3;
p[32,0]= x+67;  p[32,1] = y-5;      p[32,2]= obj_en_tur3;
p[33,0]= x+40;  p[33,1] = y+80;     p[33,2]= obj_en_tur3;
p[34,0]= x+47;  p[34,1] = y+106;    p[34,2]= obj_en_tur3;
p[35,0]= x+23;  p[35,1] = y+106;    p[35,2]= obj_en_tur3;
p[36,0]= x+74;  p[36,1] = y+145;    p[36,2]= obj_en_tur1;
p[37,0]= x+125; p[37,1] = y+155;    p[37,2]= obj_en_tur3;
p[38,0]= x+148; p[38,1] = y+162;    p[38,2]= obj_en_tur3;
p[39,0]= x+171; p[39,1] = y+170;    p[39,2]= obj_en_tur3;
p[40,0]= x+95;  p[40,1] = y+20;     p[40,2]= obj_en_tur3;
p[41,0]= x+95;  p[41,1] = y-5;      p[41,2]= obj_en_tur3;
p[42,0]= x+95;  p[42,1] = y-35;     p[42,2]= obj_en_tur3;
p[43,0]= x+95;  p[43,1] = y-65;     p[43,2]= obj_en_tur3;
p[44,0]= x+110; p[44,1] = y-140;    p[44,2]= obj_en_tur1;
p[45,0]= x+100; p[45,1] = y-100;    p[45,2]= obj_en_tur3;
p[46,0]= x+130; p[46,1] = y-104;    p[46,2]= obj_en_tur3;
p[47,0]= x+160; p[47,1] = y-110;    p[47,2]= obj_en_tur3;
p[48,0]= x+190; p[48,1] = y-130;    p[48,2]= obj_en_tur3;
p[49,0]= x+240; p[49,1] = y-140;    p[49,2]= obj_en_tur3;
p[50,0]= x+306; p[50,1] = y-179;    p[50,2]= obj_en_tur3;