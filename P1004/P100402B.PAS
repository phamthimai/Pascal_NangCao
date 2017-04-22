Program P100402b;   {Nhap va in ra mot mang so thuc}
Uses Crt;
Var  a: array[1..50,1..50] of real;
     m,n,i,j: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang (m, n): '); Readln(m,n);
 Writeln('Nhap ma tran A: ');
 For i:=1 to m do
 begin
   For j:=1 to n do Read(a[i,j]); Readln;
 end;
 Writeln('Ma tran A la:');
 For i:=1 to m do
 begin
   For j:=1 to n do write(a[i,j]:8:2); Writeln;
 end;
 Readln;
END.