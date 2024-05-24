///@desc Spawn player

// First, spawn hitbox if not already present
if !instance_exists(myhitbox) then 
myhitbox = instance_create_layer(x,y,global.lay_player,obj_hitbox);
    
var ship;
switch global.shipselect[side] 
    {
    case 1: ship = obj_xono; break;
    case 2: ship = obj_warbird; break;
    case 3: ship = obj_bh; break;
    case 4: ship = obj_trident; break;
    case 5: ship = obj_arxyne; break;
    }
	
// Then, spawn player
myplayer = instance_create_layer(x,y,global.lay_player,ship);
if global.bombs_stored[side] > -1 then myplayer.bombs = global.bombs_stored[side];

// Then assign stored ids for player/hitbox/ctrl communication
myhitbox.myplayer = myplayer;
myplayer.myhitbox = myhitbox;
myhitbox.myctrl = id;
myplayer.myctrl = id;