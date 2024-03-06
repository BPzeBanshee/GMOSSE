invincible = 180;
clear = true;
image_speed = 0.5;
visible = global.hitbox_visible;
myplayer = noone;

do_death_event = function(){
	lives -= 1;
    visible = false;
    invincible = 240;
    instance_create_layer(x,y,layer,obj_player_dead);
    with myplayer instance_destroy();
    with obj_ctrl_game respawntimer = 60;
}