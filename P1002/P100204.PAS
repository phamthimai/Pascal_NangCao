Program P100204;   {Tinh tich vo huong cua hai vecto}
Uses Crt;
Var  A,B: array[1..100] of real;
     C: real;
     n,i: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua cac vecto: n = '); Readln(n);
 Writeln('Nhap cac phan tu cua vecto A tren mot dong:');
 For i:=1 to n do Read(a[i]); Readln;
 Writeln('Nhap cac phan tu cua vecto B tren mot dong:');
 For i:=1 to n do Read(b[i]); Readln;
 C:=0;
 For i:=1 to n do C:=C+a[i]*b[i];
 Writeln('Tich vo huong cua hai vecto A va B:');
 Write(' C = ',C:8:2);
 Readln;
END.