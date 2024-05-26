invincible = 180;
damage = 100; // damage done to enemies on collision
clear = true; // bool var for image alpha
image_speed = 0.5;
visible = global.hitbox_visible;
myplayer = noone;
myctrl = noone;

do_death_event = function(){
	myctrl.mylives -= 1;
    myctrl.respawntimer = 60;
    instance_create_layer(x,y,layer,obj_player_dead);
    instance_destroy(myplayer);
	instance_destroy();
}