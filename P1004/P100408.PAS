Program P100408;   {Tinh tong hai ma tran A va B}
Uses Crt;
Var  A,B,C: array[1..50,1..50] of integer;
     m,n,i,j: integer;

BEGIN
 Clrscr;
 Write('Nhap cac kich thuoc cua hai ma tran (m, n): '); Readln(m,n);
 Writeln('Nhap ma tran A: ');
 For i:=1 to m do
 begin
   For j:=1 to n do Read(a[i,j]); Readln;
 end;
 Writeln('Nhap ma tran B: ');
 For i:=1 to m do
 begin
   For j:=1 to n do Read(b[i,j]); Readln;
 end;
 For i:=1 to m do
   For j:=1 to n do c[i,j]:=a[i,j]+b[i,j];
 Writeln('Ma tran C = A+B la:');
 For i:=1 to m do
 begin
   For j:=1 to n do write(c[i,j]:4); Writeln;
 end;
 Readln;
END.