Program P120704;  {Giai xap xi phuong trinh}
Uses Crt;
Var  x0,x: real;

Function f(x: real): real;
Begin
 f:=x*x*x+x*x+x+1;
End;

Function df(x: real): real;
Begin
 df:=3*x*x+2*x+1;
End;

BEGIN
 Clrscr;
 x0:=0;
 Repeat x0:=x; x:=x-f(x)/df(x); Until Abs(x-x0)<0.0001;
 Write(x:0:4);
 Readln;
END.