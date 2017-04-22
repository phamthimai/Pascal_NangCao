Program P120710;  {Tinh tich phan}
Uses Crt;
Var  a,b: real;

Function f(x: real): real;
Begin
 f:=3;
End;

Function Inter(a,b: real): real;
Var h,t: real; i,n: integer;
Begin
 n:=1000;
 h:=(b-a)/n;
 t:=0;
 For i:=0 to n do t:=t+f(a+i*h+h/2);
 inter:=t*h;
End;

BEGIN
 Clrscr;
 Write(' A = '); Readln(a);
 Write(' B = '); Readln(b);
 Write(inter(a,b));
 Readln;
END.