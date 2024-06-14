///@desc Flavour text
if menu == 1 switch selection 
{
case 1: 
msg = @"
A standard mover with which you can
turn to 16 directions with the
control pad.

X Button: Press to fix the direction
of the gunner.";
break;

case 2: 
msg = @"
Basically, this is the same mover as
Normal mover except that the gunner
turns towards the opposite direction
to normal mover.

X Button: Press to fix the direction
of the gunner.";
break;

case 3: 
msg = @"
You can aim at enemies 
automatically. But it does not 
necessarily move as you like. 
Do not count on it too much.

X Button: Press to change the search
program.";
break;

case 4:
msg = @"
You can deliver a 3-way attack.
The range of attack can be wide.
But you cannot concentrate your
attention to left or right.

X Button: Press to fix the direction
of the gunner.";
break;

case 5:
msg = @"
Basically, this is the same mover 
as Multi mover except that the 
gunner turns to the opposite 
direction to Multi mover.

X Button: Press to fix the direction
of the gunner.";
break;

case 6:
msg = @"
The gunner can follow your plane. 
You can attack remotely only
with this mover. But the range
of attack is limited to forward.

X Button: Press to fix the direction
of the gunner.";
break;

case 7:
msg = @"
A standard mover with which you can
turn to 16 directions with control
pad.

X Button: Press to change the
rolling program.";
break;

default: msg = "ERROR"; break;
}

if menu == 2 switch selection 
{
case 1: 
msg = @"Attack = 1 [2.25]

The Twin Shot weapon was the 
standard weapon you began with 
in NCS' 1992 Sega Megadrive game
''Advanced Busterhawk: Gleylancer''.
It is overall well-balanced and easy
to use for all difficulties.";
break;

case 2: 
msg = @"Attack = 1 [0.55]

The Laser weapon at first does not
appear to be very powerful, but
on the contrary it deals high
damage when properly used due to
its penetrative nature.";
break;
            
case 3: 
msg = @"Attack = 1 [0.25]

The Bound shot is primarly useful
for shooting around walls.
However, since there aren't always
walls in some stages of GMOSSE, this
weapon could be rendered useless.";
break;
            
case 4:
msg = @"Attack = 1 [10.25]

The Spread Bomb has an extremely
high attack power, but has the 
worst firerate of all weapons 
in G.M.O.S.S.E.
Useful for taking down singular 
targets, or smaller enemies.";
break;

case 5:
msg = @"Attack = 1 [0.5]

The Saber laser sword is quite 
powerful and useful for taking 
out enemies with multiple parts, 
however it has a short distance.
Recommended only for veterans.";
break;

case 6:
msg = @"Attack = 1 [1.25]

The Burner flamethrower is
useful depending on the 
situation at hand. Requires
concentration of flame and
relatively short distance
to operate efficiently.";
break;
            
case 7:
msg = @"Attack = 1 [5.0]

The Wide Shot has great gaps
in its shot angle angles and 
leaves proper coverage to be 
desired by the inexperienced
operator. Use at your own risk.";
break;
        
default: msg = "ERROR"; break;
}