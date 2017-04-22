Program P101403;  {so cac chu so}
Uses Crt;
Var x,i,d0,d5:integer;

BEGIN
 ClrScr;
 d0:=0; d5:=0 ;
 For i:= 1 to 1000 do
 Begin
   x:=i;
   Repeat
     If x mod 10 = 0 then d0:=d0+1;
     If x mod 10 = 5 then d5:=d5+1;
     x:= x div 10;
   Until x=0;
 End;
 Writeln(' Co tat ca  ',d0,' so 0 ');
 Writeln(' Co tat ca  ',d5,' so 5 ');
 Readln;
END.


