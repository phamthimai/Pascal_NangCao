Program P100405s;   {Lap mang B tu mang A}
Uses Crt;
Var  A: array[1..50,1..50] of integer;
     B: array[1..50] of integer;
     n,i,j: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang vuong: n = '); Readln(n);
 Writeln('Nhap ma tran A: ');
 For i:=1 to n do
 begin
   For j:=1 to n do Read(a[i,j]); Readln;
 end;
 For i:=1 to n do
   For j:=1 to n do
     If (i mod 2 <> 0) then b[(i-1)*n+j]:=a[i,j]
     Else b[(i)*n-j+1]:=a[i,j];
 Writeln('Mang B la:');
 For i:=1 to sqr(n) do Write(B[i]:8);
 Readln;
END.