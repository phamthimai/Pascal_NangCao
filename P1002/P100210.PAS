Program P100210; {Tao mang B va C tu mang A}
Uses Crt;
Var  A,B,C: array[1..100] of real;
     n,i: integer;

BEGIN
 Clrscr;
 Write('Nhap so n: '); Readln(n);
 Writeln('Nhap ',2*n,' phan tu cua mang A tren mot dong:');
 For i:=1 to 2*n do Read(a[i]); Readln;
 For i:=1 to n do
 begin
   b[2*i-1]:=a[i]; b[2*i]:=a[n+i];
   c[2*i-1]:=a[i]; c[2*i]:=a[2*n-i+1];
 end;
 Writeln('Mang thu nhat:');
 For i:=1 to 2*n do Write(B[i]:8:2); Writeln;
 Writeln('Mang thu hai:');
 For i:=1 to 2*n do Write(C[i]:8:2);
 Readln;
END.