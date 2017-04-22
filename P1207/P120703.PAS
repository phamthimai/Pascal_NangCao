Program P120703;   {Giai xap xi phuong trinh}
Uses Crt;
Var  a,b,x,ex,fa,fb,fx: real;

Function f(x: real): real;
Begin
 f:=x*x-sin(5*x);
End;

BEGIN
 ex:=0.01; a:=0.5; b:=0.6;
 Repeat
   x:=(a+b)/2;
   fa:=f(a); fb:=f(b); fx:=f(x);
   If fa*fx>0 then a:=x
   Else If fb*fx>0 then b:=x;
 Until abs(fx)<ex;
 Writeln(x:0:2);
 Readln;
END.