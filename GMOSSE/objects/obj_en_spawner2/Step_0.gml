if spawn == object_index
	{
	show_debug_message("obj_en_spawner2 value 'spawn' left on default, fix your code!");
	instance_destroy();
	}
	
if sprite_index == -1 then sprite_index = object_get_sprite(spawn);
image_alpha += 0.025;
image_xscale += 0.025;
image_yscale += 0.025;
if image_alpha >= 1
    {
    var a = instance_create_layer(x,y,global.lay_en_air,spawn);
    a.direction = image_angle; 
	a.image_angle = image_angle;
    a.speed = 4;
    instance_destroy();
    }