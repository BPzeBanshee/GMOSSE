invincible = 180;
clear = true;
image_speed = 0.5;
visible = global.hitbox_visible;
myplayer = noone;
myctrl = noone;

do_death_event = function(){
    visible = false;
    invincible = 240;
	
    instance_create_layer(x,y,layer,obj_player_dead);
    instance_destroy(myplayer);
	
	myctrl.mylives -= 1;
    myctrl.respawntimer = 60;
}