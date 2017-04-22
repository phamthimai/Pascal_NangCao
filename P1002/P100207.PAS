Program P100207; {Lap mang B tu mang A bang cach doi cho hai phan tu}
Uses Crt;
Var  A,B: array[1..100] of real;
     n,p,q,i: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang A: n = '); Readln(n);
 Writeln('Nhap cac phan tu cua mang A tren mot dong:');
 For i:=1 to n do Read(a[i]); Readln;
 Write('Nhap hai vi tri p,q<=n: '); Readln(p,q);
 For i:=1 to n do b[i]:=a[i];
 b[p]:=a[q]; b[q]:=a[p];
 Writeln('Mang B lap tu A bang cach doi cho 2 phan tu thu ',p,' va thu ',q,':');
 For i:=1 to n do Write(B[i]:8:2);
 Readln;
END.