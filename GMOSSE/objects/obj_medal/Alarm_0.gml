visible = true;
//var formula = floor(global.medalvalue / 3);
var formula = 0;

// bronze
if value > 20 formula = 1;
if value > 40 formula = 2;
if value > 60 formula = 3;
if value > 80 formula = 4;

// silver
if value >= 100 formula = 5;
if value > 200 formula = 6;
if value > 400 formula = 7;
if value > 600 formula = 8;
if value > 800 formula = 9;

// gold
if value >= 1000 formula = 10;
if value > 2000 formula = 11;
if value > 4000 formula = 12;
if value > 6000 formula = 13;
if value > 8000 formula = 14;
image_index = formula;