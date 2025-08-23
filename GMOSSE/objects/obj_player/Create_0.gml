// Default values to be overridden by child ship objects
shipspeed = 4;
slowshipspeed = 2;
bombs = 3;
max_bombs = 5;

myhitbox = noone;
myctrl = noone;

has_afterimage = false;
afterimage_spr = -1;
outline_spr = -1;

has_banking = true;
img_bank_center = image_number > 0 ? (image_number - 1)/2 : 0;
img = img_bank_center; //trace("img: "+string(img));
img_bank_spd = image_number > 5 ? 0.4 : 0.2;
image_speed = 0;

up = false;
down = false;
left = false;
right = false;
b1 = false;
b2 = false;
b3 = false;