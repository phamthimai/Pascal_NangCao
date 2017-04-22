Program P120720;  {Sinh so ngau nhien phan bo deu cua (1,2,3,5,6)}
Uses  Crt;
Const a: array [1..5] of integer = (1,2,3,5,6);
Var   v,i : integer;
      x   : real;
      p,ii: array [0..5] of real;

BEGIN
 Clrscr;
 ii[0]:=0;
 For i:=1 to 5 do
 begin
   p[i]:=1/5;
   ii[i]:=ii[i-1]+p[i];
 end;
 Repeat
   x:=random;
   For i:=1 to 5 do
     If (x>=ii[i-1])and(x<ii[i]) then v:=a[i];
   Write(v);
 Until KeyPressed;
END.