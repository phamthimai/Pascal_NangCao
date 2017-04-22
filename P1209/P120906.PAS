Program P120906;  {Phan ung co the khi tiem thuoc}
Uses  Crt;
Const eps=0.4; crr=0.01;
Var   a: real;
      x,max,min,ff: real;
      kq1,kq2     : real;

Function lt(a,x: real): real;  {Tinh a mu x}
Begin
 If a<>0 then lt:=exp(x*ln(a)) Else lt:=0;
End;

Function f(x: real): real;
Begin
 f:=(lt(0.4,x+1)-lt(a,x+1))/(0.4-a);
End;

BEGIN
 Clrscr;
 Write('Nhap 0<a<1: '); Readln(a);
 x:=0;
 max:=0; min:=maxint;
 Repeat
   ff:=f(x);
   If ff>max then
   begin
     max:=ff;
     kq1:=x;
   end;
   If abs(ff-0.5)<min then
   begin
     min:=abs(ff-0.5);
     kq2:=x;
   end;
   x:=x+crr;
 Until ff<eps;
 Writeln('Phan ung manh nhat sau ',kq1:0:2,' gio');
 Writeln('Phan ung con mot nua sau ',kq2:0:2,' gio');
 Readln;
END.