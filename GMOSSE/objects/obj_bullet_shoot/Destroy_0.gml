switch (btype)
    {
    case 2:
        {
        // This emulates DDP: DFK Taisabachi/Golden Disaster's and 
        // Shooty's canister bomb pattern.
        scr_circleshot02(30,x,y,0,obj_bullet2,0.5,false);
        scr_circleshot02(30,x,y,0,obj_bullet2,1,false);
        scr_circleshot02(30,x,y,0,obj_bullet2,1.5,false);
        scr_playsnd(snd_en_shot2,1);
        break;
        }
    case 3:
        {
        // Creates homing bullet rings. Oh the horror.
        scr_circleshot02(20,x,y,0,obj_bullet_homing,2.8,false);
        scr_playsnd(snd_en_shot2,1);
        break;
        }
    }

