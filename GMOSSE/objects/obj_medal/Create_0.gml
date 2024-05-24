image_speed = 0;
visible = false;
alarm[0] = 1;

speed = 2;
direction = 90;
gravity = 0.1;

value = 10000;
if global.medalvalue >= 20 && global.medalvalue < 29 then value = 1000 * (global.medalvalue-19);
if global.medalvalue > 10 && global.medalvalue < 20 then value = 100 * (global.medalvalue-9);
if global.medalvalue <= 10 then value = global.medalvalue * 10;

/*
10, 20, 30, 40, 50, 60, 70, 80, 90, 100,
200, 300, 400, 500, 600, 700, 800, 900, 
1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000
*/