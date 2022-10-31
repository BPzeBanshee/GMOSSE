/// @description  Create the player ship
if !instance_exists(obj_hitbox) then instance_create_layer(x,y,global.lay_player,obj_hitbox);
    
switch global.shipselect 
    {
    case 1: instance_create_layer(x,y,global.lay_player,obj_xono); break;
    case 2: instance_create_layer(x,y,global.lay_player,obj_warbird); break;
    case 3: instance_create_layer(x,y,global.lay_player,obj_bh); break;
    case 4: instance_create_layer(x,y,global.lay_player,obj_sf); break;
    case 5: instance_create_layer(x,y,global.lay_player,obj_arxyne); break;
    }