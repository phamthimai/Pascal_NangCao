Program P100203;   {Tinh tong cua hai vecto}
Uses Crt;
Var  A,B,C: array[1..100] of real;
     n,p,i: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua cac vecto: n = '); Readln(n);
 Writeln('Nhap cac phan tu cua vecto A tren mot dong:');
 For i:=1 to n do Read(a[i]); Readln;
 Writeln('Nhap cac phan tu cua vecto B tren mot dong:');
 For i:=1 to n do Read(b[i]); Readln;
 For i:=1 to n do c[i]:=a[i]+b[i];
 Writeln('Tong cua hai vecto A va B:');
 For i:=1 to n do Write(c[i]:8:2);
 Readln;
END.