Program P120717;  {Sinh so ngau nhien}
Uses Crt;
Var  i: integer;

BEGIN
 Clrscr;
 Randomize;
 Repeat
   Write(random(2));
 Until KeyPressed;
END.