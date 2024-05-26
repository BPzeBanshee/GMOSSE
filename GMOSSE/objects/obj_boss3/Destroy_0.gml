///@desc Destroy turrets
for (var i=0;i<=2;i+=1) //turret[i]
    {
    for (var j=0;j<=4;j+=1) //turret[i,j]
        {
        if instance_exists(turret[i,j])
        then instance_destroy(turret[i,j]);
        }
    }