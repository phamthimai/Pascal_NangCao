Program P120602;   {Tinh giao cua hai ma tran}
Uses  Crt;
Const fi='Mt.inp';
      fo2='giao.out';
      max=100;
Var   A,B,G: Array [1..max,1..max] of byte;
      f    : Text;
      m,n  : Byte;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,m,n);
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,A[i,j]); Readln(f);
 end;
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,B[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Giao;
Var i,j: byte;
Begin
 For i:=1 to m do
   For j:=1 to n do G[i,j]:=a[i,j] and B[i,j];
End;

Procedure Xuly;
Begin
 Giao;
End;

Procedure Ketqua;
Var i,j: byte;
Begin
 Assign(f,fo2); Rewrite(f);
 For i:=1 to m do
 begin
   For j:=1 to n do Write(f,g[i,j],' ');
   Writeln(f);
 end;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Xuly;
 Ketqua;
END.
input:
      2 3
      1 0 1
      0 1 0
      1 0 1
      0 1 0
output:
      0 0 0
      0 1 0