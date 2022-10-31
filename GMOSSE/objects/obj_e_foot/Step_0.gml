if !made
    {
    myfoot = instance_create_layer(x,y,layer,obj_e_foot2);
    myfoot.z = 100;
    made = true;
    }
else
	{
	if x != xx || y != yy
	    {
	    if myfoot.z < 128 then myfoot.z += 2;
	    if myfoot.z == 128 then step_towards_point(xx,yy,2);//mp_linear_step(xx,yy,2,0);
	    }
	else
	    {
	    if myfoot.z > 100 then myfoot.z -= 2;
	    }   
	myfoot.x = x;
	myfoot.y = y;
	}