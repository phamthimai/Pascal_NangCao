Program P120601;   {Hop cua hai ma tran nhi phan}
Uses  Crt;
Const fi='P1206\Mt.inp';
      fo1='hop.out';
      max=100;
Var   A,B,H: Array [1..max,1..max] of byte;
      F    : Text;
      m,n  : Byte;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(F,fi); Reset(f);
 Readln(f,m,n);
 For i:=1 to m do
 begin
   For j:=1 to n do Read(F,A[i,j]);
   Readln(F);
 end;
 For i:=1 to m do
 begin
   For j:=1 to n do Read(F,B[i,j]);
   Readln(F);
 end;
 Close(f);
End;

Procedure Hop;
Var i,j: byte;
Begin
 For i:=1 to m do
   For j:=1 to n do H[i,j]:=a[i,j] or B[i,j];
End;

Procedure Xuly;
Begin
 Hop;
End;

Procedure Ketqua;
Var i,j: byte;
Begin
 Assign(F,fo1); Rewrite(f);
 For i:=1 to m do
 begin
   For j:=1 to n do Write(f,h[i,j],' ');
   Writeln(f);
 end;
 Readln;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Xuly;
 Ketqua;
END.

{input:
      2 3
      1 0 1
      0 1 0
      1 0 1
      0 1 0
output:
      1 1 1
      1 1 0