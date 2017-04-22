Program P120701;   {Giai xap xi phuong trinh}
Uses Crt;
Var  a,b,x,ex,fa,fb,fx: real;

Function f(x: real): real;
Begin
 f:=x*x*x+x*x+x+1;
End;

BEGIN
 ex:=0.0001; a:=-5; b:=5;
 Repeat
   x:=(a+b)/2;
   fa:=f(a); fb:=f(b); fx:=f(x);
   If fa*fx>0 then a:=x
   Else If fb*fx>0 then b:=x;
 Until abs(fx)<ex;
 Writeln(x:0:4);
 Readln;
END.