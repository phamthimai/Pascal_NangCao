Program P120603;   {Tich logic cua hai ma tran}
Uses  Crt;
Const fi='Mt3.inp';
      fo='Mt3.out';
      max=100;
Var   A,B,G: Array [1..max,1..max] of byte;
      f    : Text;
      m,n,k: Byte;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,m,k,n);
 For i:=1 to m do
 begin
   For j:=1 to k do Read(f,a[i,j]); Readln(f);
 end;
 For i:=1 to k do
 begin
   For j:=1 to n do Read(f,B[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Xuly;
Var i,j,t,p: byte;
Begin
 For i:=1 to m do
   For j:=1 to n do
   begin
     p:=a[i,1] and b[1,j];
     For t:=2 to k do p:=p or (a[i,t] and b[t,j]);
     c[i,j]:=p;
   end;
End;

Procedure Ketqua;
Var i,j: byte;
Begin
 Assign(f,fo); Rewrite(f);
 For i:=1 to m do
 begin
   For j:=1 to n do Write(f,c[i,j],' '); Writeln(f);
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
      3 2 3
       1 0
       0 1
       1 0
       1 1 0
       0 1 1
output:
       1 1 0
       0 1 1
       1 1 0