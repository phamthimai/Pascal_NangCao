Program P120709;   {Tinh exp(x)}
Uses Crt;
Var  i: longint;
     ex,t,d,x: real;

BEGIN
 Clrscr;
 Writeln;
 Write('X = '); Readln(x);
 ex:=0.0000000001;
 i:=1;
 t:=1;
 d:=1;
 Repeat
   d:=d*x/i;
   t:=t+d;
   Inc(i,1);
 Until abs(d)<ex;
 Write('Exp(x) = ',t:0:10);
 Readln;
END.