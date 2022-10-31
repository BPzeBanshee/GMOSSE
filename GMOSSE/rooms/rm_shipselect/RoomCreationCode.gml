global.pausable = false;
global.behaviour = 1;
var l = layer_get_id("lay_menu_fx");
var star;
repeat 60
    {
    star = scr_basicshot(random(240),random(320),l,obj_star,random_range(2,8),270);
    star.image_index = irandom(4);
    star.image_speed = 0;
    }