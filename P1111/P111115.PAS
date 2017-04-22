Program P111115;  {Tao ma tran lien thong}
Uses  Crt;
Const nmax=100;
      inp='P11\P1111\P111115.inp';
      out='P11\P1111\P111115.out';
Var   f: text;
      n: byte;
      a: array [1..nmax,1..nmax] of byte;
      b: array [1..nmax,1..nmax] of integer;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure XuLy;
Var i,j,k: byte;
Begin
 For i:=1 to n do
   For j:=1 to n do
     If a[i,j]=1 then b[i,j]:=1 Else b[i,j]:=10000;
 For k:=1 to n do
   For i:=1 to n do
     For j:=1 to n do
       If b[i,j]>b[i,k]+b[k,j] then b[i,j]:=b[i,k]+b[k,j];
End;

Procedure InKQ;
Var i,j: byte;
Begin
 Assign(f,out); Rewrite(f);
 For i:=1 to n do
 begin
   For j:=1 to n do
     If b[i,j]=10000 then Write(f,0:2) Else Write(f,1:2);
   Writeln(f);
 end;
 Close(f);
End;

BEGIN
 Nhap;
 XuLy;
 InKQ;
END.