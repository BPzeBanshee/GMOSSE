/// @description Picks one of six different explosion types. Written by S20-TBL and modified by BPzeBanshee.
/// @param {Asset.GMObject} object
/// @param {Real} amount
/// @param {Real} countup
function scr_create_exp(object,amount,countup) {
	/* 
	"Contra Yagawa Corps Eksploshunz by Michael Bay!"
	by S20-TBL
	put into standalone script by BPzeBanshee

	example usage:
	'scr_create_exp(obj_explosion,360,18)'
	*/
	var choice,spd,scl;
	choice = irandom_range(1,6);
	spd = 0.1;
	scl = 1;
	switch choice
	    {
	    case 1: // explode_spiral01
	        {
	        var _x, _y, _bullet;
	        for (var i = 0; i <= amount; i+=countup)
	            {
	            _x = lengthdir_x(0,i)+x;
	            _y = lengthdir_y(0,i)+y;
	            _bullet[i] = instance_create_depth(_x,_y,depth-1,object);
	            _bullet[i].speed = 0.25+(i/42);
	            _bullet[i].direction= i;
	            _bullet[i].image_speed = spd;
	            _bullet[i].image_xscale = scl;
	            _bullet[i].image_yscale = scl;
	            }
	        break;
	        }
	    case 2: // explode_spiral02
	        {
	        var _x, _y, _bullet;
	        for (var i = 0; i <= amount; i+=countup)
	            {
	            _x = lengthdir_x(0,i)+x;
	            _y = lengthdir_y(0,i)+y;
	            _bullet[i] = instance_create_depth(_x,_y,depth-1,object);
	            _bullet[i].speed = 0.25+(i/42);
	            _bullet[i].direction= -i;
	            _bullet[i].image_speed = spd;
	            _bullet[i].image_xscale = scl;
	            _bullet[i].image_yscale = scl;
	            }
	        break;
	        }
	    case 3: // explode_linear
	        {
	        var _x, _y, _bullet, _lead;

	        _lead = instance_create_depth(x,y,depth-1,object);
	        _lead.speed = (amount/42)+0.5;
	        _lead.direction = random (360);
	        for (var i = 0; i <= amount; i+=countup)
	            {
	            _x = lengthdir_x(0,i)+x;
	            _y = lengthdir_y(0,i)+y;
	            _bullet[i] = instance_create_depth(_x,_y,depth-1,object);
	            _bullet[i].speed = 0.25+(i/42);
	            _bullet[i].direction= _lead.direction;
	            _bullet[i].image_speed = spd;
	            _bullet[i].image_xscale = scl;
	            _bullet[i].image_yscale = scl;
	            }
	        break;
	        }
	    case 4: // explode_scatter
	        {
	        var _x, _y, _bullet;
	        for (var i = 0; i <= amount; i+=countup)
	            {
	            _x = lengthdir_x(0,i)+x;
	            _y = lengthdir_y(0,i)+y;
	            _bullet[i] = instance_create_depth(_x,_y,depth-1,object);
	            _bullet[i].speed = 0.25+(i/42);
	            _bullet[i].direction= random(amount);
	            _bullet[i].image_speed = spd;
	            _bullet[i].image_xscale = scl;
	            _bullet[i].image_yscale = scl;
	            }
	        break;
	        }
	    case 5: // explode_circle01
	        {
	        var _x, _y, _bullet;
	        for (var i = 0; i <= amount; i+=countup)
	            {
	            _x = lengthdir_x(0,i)+x;
	            _y = lengthdir_y(0,i)+y;
	            _bullet[i] = instance_create_depth(_x,_y,depth-1,object);
	            _bullet[i].speed = 3.5;
	            _bullet[i].direction= i;
	            _bullet[i].image_speed = spd;
	            _bullet[i].image_xscale = scl;
	            _bullet[i].image_yscale = scl;
	            }
	        break;
	        }
	    case 6: // explode_circle02
	        {
	        var _x, _y, _bullet;
	        for (var i = 0; i <= amount; i+=countup)
	            {
	            _x = lengthdir_x(0,i)+x;
	            _y = lengthdir_y(0,i)+y;
	            _bullet[i] = instance_create_depth(_x,_y,depth-1,object);
	            _bullet[i].speed = random_range(2,4);
	            _bullet[i].direction= i;
	            _bullet[i].image_speed = spd;
	            _bullet[i].image_xscale = scl;
	            _bullet[i].image_yscale = scl;
	            }
	        break;
	        }
	    }
}