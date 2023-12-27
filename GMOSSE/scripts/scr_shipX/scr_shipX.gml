function scr_shipobj(shipID){
switch shipID
	{
	case 1: return obj_xono;
	case 2: return obj_warbird;
	case 3: return obj_bh;
	case 4: return obj_trident;
	case 5: return obj_arxyne;
	default: return -1;
	}
}

function scr_shipid(shipOBJ){
switch shipOBJ
	{
	case obj_xono: return 1;
	case obj_warbird: return 2;
	case obj_bh: return 3;
	case obj_trident: return 4;
	case obj_arxyne: return 5;
	default: return -1;
	}
}

function scr_shipspr(shipID){
return object_get_sprite(scr_shipobj(shipID));
}