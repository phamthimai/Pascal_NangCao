Program P100208; {Tinh trung binh cong va sai so}
Uses Crt;
Var  A: array[1..100] of real;
     s,x: real;
     n,i: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang A: n = '); Readln(n);
 Writeln('Nhap cac phan tu cua mang A tren mot dong:');
 For i:=1 to n do Read(a[i]); Readln;
 x:=0;
 For i:=1 to n do x:=x+a[i];
 x:=x/n;
 s:=0;
 For i:=1 to n do s:=s+sqr(a[i]-x);
 s:=sqrt(s)/(n-1);
 Writeln('Tri trung binh cua a la: ',x:0:2);
 Writeln('              Sai so la: ',s:0:2);
 Readln;
END.