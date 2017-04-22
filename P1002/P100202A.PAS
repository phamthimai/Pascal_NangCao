Program P100202a;   {Nhap va in ra mot mang so thuc}
Uses Crt;
Var  a: array[1..100] of real;
     n,i: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang: n = '); Readln(n);
 Writeln('Nhap cac phan tu cua mang, moi phan tu tren mot dong:');
 For i:=1 to n do
 begin
   Write('a[',i:2,'] = '); Readln(a[i]);
 end;
 For i:=1 to n do Writeln('a[',i:2,'] = ',a[i]:8:2);
 Readln;
END.