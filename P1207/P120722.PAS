Program P120722;
{Sinh day so ngau nhien phan bo khong deu cua (1,2,3,4)}
Uses Crt;
Const a  : array [1..4] of integer = (1,2,3,4);
      p  : array [1..4] of real = (1/8,1/8,1/4,1/2);
Var   v,i: integer;
      x  : real;
      ii : array [0..10] of real;

BEGIN
 Clrscr;
 ii[0]:=0; For i:=1 to 4 do ii[i]:=ii[i-1]+p[i];
 Repeat
   x:=random;
   For i:=1 to 4 do
     If (x>=ii[i-1])and(x<ii[i]) then v:=a[i];
   Write(v);
 Until KeyPressed;
END.