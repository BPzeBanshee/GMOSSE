///@desc Spawn player

// First, spawn hitbox if not already present
if !instance_exists(myhitbox) 
myhitbox = instance_create_layer(x,y,global.lay_player,obj_hitbox);
    
var ship;
switch global.player_data.shipselect
    {
    case 1: ship = obj_xono; break;
    case 2: ship = obj_warbird; break;
    case 3: ship = obj_bh; break;
    case 4: ship = obj_trident; break;
    case 5: ship = obj_arxyne; break;
    }
	
// Then, spawn player
myplayer = instance_create_layer(x,y,global.lay_player,ship);
myplayer.weapontype = weapontype;
myplayer.optiontype = optiontype;
if mybombs > -1 myplayer.bombs = mybombs;

// Then assign stored ids for player/hitbox communication
myhitbox.myctrl = id;
myplayer.myctrl = id;
myhitbox.myplayer = myplayer;
myplayer.myhitbox = myhitbox;
gameover = false;