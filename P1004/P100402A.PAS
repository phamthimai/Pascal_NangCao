Program P100402a;   {Nhap va in ra mot mang so thuc}
Uses Crt;
Var  a: array[1..50,1..50] of real;
     m,n,i,j: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang (m,n): '); Readln(m,n);
 Writeln('Nhap cac phan tu cua mang, moi phan tu tren mot dong:');
 For i:=1 to m do
   For j:=1 to n do
   begin
     Write('a[',i:2,',',j:2,'] = '); Readln(a[i,j]);
   end;
 For i:=1 to m do
   For j:=1 to n do Writeln('a[',i:2,',',j:2,'] = ',a[i,j]:8:2);
 Readln;
END.