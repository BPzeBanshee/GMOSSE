///@desc Create the player ship
if !instance_exists(myhitbox) then 
myhitbox = instance_create_layer(x,y,global.lay_player,obj_hitbox);
    
var ship;
switch global.shipselect 
    {
    case 1: ship = obj_xono; break;
    case 2: ship = obj_warbird; break;
    case 3: ship = obj_bh; break;
    case 4: ship = obj_trident; break;
    case 5: ship = obj_arxyne; break;
    }
	
myplayer = instance_create_layer(x,y,global.lay_player,ship);
myplayer.myhitbox = myhitbox;
if global.bombs_stored > -1 then myplayer.bombs = global.bombs_stored;
myhitbox.myplayer = myplayer;