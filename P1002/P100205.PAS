Program P100205; {Lap mang B tu mang A bang loai bo phan tu thu p}
Uses Crt;
Var  A,B: array[1..100] of real;
     n,p,i: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang A: n = '); Readln(n);
 Writeln('Nhap cac phan tu cua mang A tren mot dong:');
 For i:=1 to n do Read(a[i]); Readln;
 Write('Nhap so p<=n: '); Readln(p);
 For i:=1 to n-1 do
   If i<p then b[i]:=a[i] Else b[i]:=a[i+1];
 Writeln('Mang B lap tu A bang cach loai bo phan tu thu ',p,':');
 For i:=1 to n-1 do Write(B[i]:8:2);
 Readln;
END.