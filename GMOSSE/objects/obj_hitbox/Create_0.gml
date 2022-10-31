invincible = 180;
clear = true;
image_speed = 0.5;
visible = global.hitbox_visible;

do_death_event = function(){
	lives -= 1;
    global.bombs = global.init_bombs;
    visible = false;
    invincible = 240;
    instance_create_layer(x,y,layer,obj_player_dead);
    with obj_player instance_destroy();
    with obj_ctrl_game respawntimer = 60;
}