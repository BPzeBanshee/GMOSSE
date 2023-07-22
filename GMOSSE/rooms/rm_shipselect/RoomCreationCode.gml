global.pausable = false;
var l = layer_get_id("lay_menu_fx");
var star;
repeat 60
    {
    star = scr_basicshot(random(240),random(320),l,obj_star,random_range(2,8),270);
	star.init(1);
    }