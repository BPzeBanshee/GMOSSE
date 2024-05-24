visible = true;
//var formula = floor(global.medalvalue / 3);
var formula = 0;

// bronze
if value > 20 then formula = 1;
if value > 40 then formula = 2;
if value > 60 then formula = 3;
if value > 80 then formula = 4;

// silver
if value >= 100 then formula = 5;
if value > 200 then formula = 6;
if value > 400 then formula = 7;
if value > 600 then formula = 8;
if value > 800 then formula = 9;

// gold
if value >= 1000 then formula = 10;
if value > 2000 then formula = 11;
if value > 4000 then formula = 12;
if value > 6000 then formula = 13;
if value > 8000 then formula = 14;
image_index = formula;