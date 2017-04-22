Program P120707;   {Tinh pi}
Uses Crt;
Var  i: longint;
     ex,t,d,dau: real;

BEGIN
 Clrscr;
 ex:=0.00001;
 i:=1;
 dau:=1;
 t:=0;
 Repeat
   d:=dau/i;
   Inc(i,2);
   t:=t+d;
   dau:=-dau;
 Until abs(d)<ex;
 Write(4*t:0:5);
 Readln;
END.