Program P100212; {Lap mang B[1..10] tu mang A[1..n]}
Uses Crt;
Var  A,B: array[1..100] of real;
     n,i,j: integer;

BEGIN
 Clrscr;
 Write('Nhap do dai cua mang A: n = '); Readln(n);
 Writeln('Nhap cac phan tu cua mang A tren mot dong:');
 For i:=1 to n do Read(a[i]); Readln;
 For i:=1 to 10 do
 begin
   b[i]:=0;
   For j:=1 to n do
     If (a[j]>i-1)and(a[j]<=i) then b[i]:=b[i]+a[j];
 end;
 Writeln('Mang B la:');
 For i:=1 to 10 do Write(B[i]:8:2);
 Readln;
END.