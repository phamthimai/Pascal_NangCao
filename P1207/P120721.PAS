Program P120721;
{Sinh day so ngau nhien phan bo deu cua (0,1,2,3,4,5,6,7,8,9)}
Uses Crt;
Const a: array [1..10] of integer = (0,1,2,3,4,5,6,7,8,9);
Var   v,i: integer;
      x: real;
      p,ii: array [0..10] of real;

BEGIN
 Clrscr;
 ii[0]:=0;
 For i:=1 to 10 do
 begin
   p[i]:=1/10;
   ii[i]:=ii[i-1]+1/10;
 end;
 Repeat
   x:=random;
   For i:=1 to 10 do
     If (x>=ii[i-1]) and (x<ii[i]) then v:=a[i];
     Write(v);
 Until Keypressed;
END.