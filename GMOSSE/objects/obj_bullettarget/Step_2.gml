// If the bullet leaves the screen, destroy itself.  
if (x < xview-sprite_width/2) || (x > xview+240+sprite_width/2) 
|| (y < yview-sprite_width/2) || (y > yview+320+sprite_width/2) 
then instance_destroy(); 

if global.bulletcolour == 2
    {
    // change to red sprite
    if sprite_index != sprite_alt then sprite_index = sprite_alt;
    }
    
if global.bulletcolour == 3
    {
    // Filter out child objects that don't need to do this.
    if object_index == obj_bullet_shoot 
        {
        if sprite_index != sprite_alt then sprite_index = sprite_alt; 
        }
    
    // Change sprite if on collision line with player
    var col = collision_line(x,y,x+lengthdir_x(240,direction),y+lengthdir_y(240,direction),obj_player,0,0);
    if col > -1 || distance_to_object(obj_hitbox) < 40   
        {
        if sprite_index != sprite_alt then sprite_index = sprite_alt;
        }
    else sprite_index = sprite_def;
    }

/*if collision_tile(1000000,vk_right)
|| collision_tile(1000000,vk_left)
|| collision_tile(1000000,vk_up)
|| collision_tile(1000000,vk_down)
then event_perform(ev_collision,obj_en_wall);*/
/*
// This draws a line and is used in Draw event for testing purposes.
// Don't use for proper game design unless you want something pointlessly
// expensive in terms of resources to play.
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
// /\ GM 8.0 equivalent of draw_self, only needed if using draw functions
draw_set_color(c_red);
draw_set_alpha(0.25);
draw_line_width(x,y,x+lengthdir_x(240,direction),y+lengthdir_y(240,direction),sprite_width);
// /\ draws line showing trajectory
*/

/* */
/*  */
