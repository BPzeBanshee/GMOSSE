//Use:    collision_tile(layer, direction)
//
//For example
//        collision_tile(1000000,vk_right)

switch argument1
{
case vk_left:
    for (tile=bbox_top;tile<=bbox_bottom;tile+=2)
        if tile_exists(tile_layer_find(argument0,bbox_left-1,tile))
            if tile_get_top(tile_layer_find(argument0,bbox_left-1,tile))=0
            {
                return 1;
                break;
            }
    break;

case vk_right:
    for (tile=bbox_top;tile<=bbox_bottom;tile+=2)
        if tile_exists(tile_layer_find(argument0,bbox_right+1,tile))
            if tile_get_top(tile_layer_find(argument0,bbox_right+1,tile))=0
            {
                return 1;
                break;
            }
    break;
            
case vk_up:
    for (tile=bbox_left;tile<=bbox_right;tile+=2)
        if tile_exists(tile_layer_find(argument0,tile,bbox_top-1))
            if tile_get_top(tile_layer_find(argument0,tile,bbox_top-1))=0
            {
                return 1;
                break;
            }
    break;

case vk_down:
    for (tile=bbox_left;tile<=bbox_right;tile+=2)
        if tile_exists(tile_layer_find(argument0,tile,bbox_bottom+1))
            if tile_get_top(tile_layer_find(argument0,tile,bbox_bottom+1))=0
            {
                return 1;
                break;
            }
    break;
}
