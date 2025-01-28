//Shooting homing blast of doom
var e = scr_basicshot(xx,yy,global.lay_bullets,obj_bullet_shoot,0,direction);
e.btype = 3;
instance_create_layer(xx,yy,global.lay_bullets,obj_bulletcancel);