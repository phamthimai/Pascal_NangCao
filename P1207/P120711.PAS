Program P120711;   {Tinh tich phan}
Uses Crt;
Var  a,b: real;

Function f(x: real): real;
Begin
 f:=3;
End;

Function Inter1(a,b: real; n: longint): real;
Var h,t: real; i: longint;
Begin
 h:=(b-a)/n;
 t:=0;
 For i:=0 to n do t:=t+f(a+i*h+h/2);
 inter1:=t*h;
End;

Function Inter(a,b: real): real;
Var n0,i: longint; e,t,t1: real;
Begin
 e:=0.001;
 n0:=10;
 t:=inter1(a,b,n0);
 i:=1;
 Repeat
   t1:=t;
   t:=inter1(a,b,2*i*n0);
   Inc(i);
 Until abs(t-t1)<e;
 inter:=t;
End;

BEGIN
 Clrscr;
 Write(' A = ');Readln(a);
 Write(' B = ');Readln(b);
 Write(inter(a,b));
 Readln;
END.