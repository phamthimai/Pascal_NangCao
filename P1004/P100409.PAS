Program P100409;   {Tinh tich hai ma tran A va B}
Uses Crt;
Var  A,B,C: array[1..50,1..50] of integer;
     i,j,k,l,m,n: integer;

BEGIN
 Clrscr;
 Write('Nhap cac kich thuoc cua hai ma tran (m, k, n): '); Readln(m,k,n);
 Writeln('Nhap ma tran A kich thuoc ',m,'*',k,': ');
 For i:=1 to m do
 begin
   For j:=1 to k do Read(a[i,j]); Readln;
 end;
 Writeln('Nhap ma tran B kich thuoc ',k,'*',n,': ');
 For l:=1 to k do
 begin
   For j:=1 to n do Read(b[l,j]); Readln;
 end;
 For i:=1 to m do
   For j:=1 to n do
   begin
      c[i,j]:=0; For l:=1 to k do c[i,j]:=c[i,j]+a[i,l]*b[l,j];
   end;
 Writeln('Ma tran C = A*B la:');
 For i:=1 to m do
 begin
   For j:=1 to n do write(c[i,j]:4); Writeln;
 end;
 Readln;
END.