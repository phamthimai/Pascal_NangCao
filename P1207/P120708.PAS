Program P120708;   {Tinh e}
Uses Crt;
Var  i: longint;
     ex,t,d: real;

BEGIN
 Clrscr;
 ex:=0.0000000001;
 i:=1;
 t:=0;
 d:=1;
 Repeat
   t:=t+d;
   d:=d/i;
   Inc(i,1);
 Until abs(d)<ex;
 Write(t:0:10);
 Readln;
END.