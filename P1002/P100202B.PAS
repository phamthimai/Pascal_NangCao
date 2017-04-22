Program P100202b;   {Nhap va in ra mot mang so thuc}
Uses Crt;
Var  a: array[1..100] of real;
     n,i: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang: n = '); Readln(n);
 Writeln('Nhap cac phan tu cua mang tren mot dong:');
 For i:=1 to n do Read(a[i]); Readln;
 For i:=1 to n do Write(a[i]:8:2);
 Readln;
END.