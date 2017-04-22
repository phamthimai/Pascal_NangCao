Program P120611;   {Cac thu tuc voi ma tran cho truoc}
Uses  Crt;
Const max=100;
      fi='mt.inp';
Var   m,n: byte;
      A  : Array [1..max,1..max] of Real;
      f  : Text;
      c  : char;
      x,y: byte;
      z  : integer;

Procedure Nhap;
Begin
 Assign(F,Fi); Reset(f);
 Readln(f,m,n);
 Close(f);
End;

Procedure Doicho(x,y: byte);
Var i: byte; tg: real;
Begin
 For i:=1 to n do
 begin
   tg:= a[x,i];
   a[x,i]:=a[y,i];
   a[y,i]:=tg;
 end;
End;

Procedure Chia(x: byte; Z: integer);
Var i: byte;
Begin
 For i:=1 to n do A[x,i]:=a[x,i]/z;
End;

Procedure Thay(x,y: byte; z: integer);
Var i: byte;
Begin
 For i:=1 to n do a[x,i]:=a[x,i]+z*a[y,i];
End;

BEGIN
 Clrscr;
 Nhap;
 Readln;
END.