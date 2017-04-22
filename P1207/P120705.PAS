Program P120705;  {Giai xap xi phuong trinh}
Uses Crt;
Var  x0,x: real;

Function f(x: real): real;
Begin
 f:=x*x*x-2*x*x+x-3;
End;

Function df(x: real): real;
Begin
 df:=3*x*x-4*x+1;
End;

BEGIN
 Clrscr;
 x0:=2.2;
 Repeat
   x0:=x;
   x:=x-f(x)/df(x);
 Until Abs(x-x0)<0.0001;
 Write(x:0:4);
 Readln;
END.