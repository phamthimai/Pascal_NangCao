Program P100407;   {Tao ma tran B la chuyen vi cua A}
Uses Crt;
Var  A,B: array[1..50,1..50] of integer;
     m,n,i,j: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang A (m, n): '); Readln(m,n);
 Writeln('Nhap ma tran A: ');
 For i:=1 to m do
 begin
   For j:=1 to n do Read(a[i,j]); Readln;
 end;
 For i:=1 to m do
   For j:=1 to n do b[j,i]:=a[i,j];
 Writeln('Ma tran B la:');
 For j:=1 to n do
 begin
   For i:=1 to m do write(b[j,i]:4); Writeln;
 end;
 Readln;
END.