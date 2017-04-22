Program P120706;  {Giai xap xi phuong trinh}
Uses Crt;
Var  x0,x: real;

Function f(x: real): real;
Begin
 f:=sin(x)/cos(x)-x;
End;

Function df(x: real): real;
Begin
 df:=1/sqr(cos(x));
End;

BEGIN
 Clrscr;
 x0:=4.6;
 Repeat
   x0:=x;
   x:=x-f(x)/df(x);
 Until Abs(x-x0)<0.0001;
 Writeln;
 Write(x:0:4);
 Readln;
END.