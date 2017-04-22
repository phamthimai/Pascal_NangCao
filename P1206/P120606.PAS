Program P120606;    {Tinh tich Tenxo}
Uses  Crt;
Const max=100;
      fi='Tenxo.inp';
      fo='Tenxo.out';
Var   A,B,C  : Array [1..max,1..max] of integer;
      m,n,p,q: Byte;
      f      : Text;
      ok     : boolean;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,m,n,p,q);
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 For i:=1 to p do
 begin
   For j:=1 to q do Read(f,b[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Xuly;
Var i,j,r,s: byte;
Begin
 For i:=1 to m do
   For j:=1 to n do
     For r:=1 to p do
       For s:=1 to q do
         C[(i-1)*p+r,(j-1)*q+s]:=A[i,j]*B[r,s];
End;

Procedure Ketqua;
Var i,j: byte;
Begin
 Assign(f,fo); Rewrite(f);
 If Ok then
   For i:=1 to m*p do
   begin
     For j:=1 to n*q do Write(f,C[i,j],' '); Writeln(f);
   end;
 If not Ok then Writeln(f,'Du lieu sai .Xem lai m,n,p,q');
 Close(f);
End;

BEGIN
 CLrscr;
 Nhap;
 Ok:=false;
 If (m*p<=100) and (n*q<=100) then
 begin
   Ok:=true;
   Xuly;
 end;
 Ketqua;
END.

input:
   2 2 2 3
   1 2
   3 4
   0 1 5
   -1 3 7
Output:
   0 1 5 0 2 10
   -1 3 7 -2 6 14
   0 3 15 0 4 20
   -3 9 21 -4 12 28
