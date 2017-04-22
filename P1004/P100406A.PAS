Program P100406a;      {Lap mang A tu mang B}
Uses Crt;
Var  A: array[1..50,1..50] of integer;
     B: array[1..50] of integer;
     n,i,j: integer;

BEGIN
 Clrscr;
 Write('Nhap so n: '); Readln(n);
 Writeln('Nhap mang B do dai ',sqr(n),': ');
 For i:=1 to sqr(n) do Read(b[i]); Readln;
 For i:=1 to sqr(n) do
   If (((i-1)div n)mod 2 = 0) then a[(i-1)div n+1,(i-1)mod n+1]:=b[i]
   Else  a[(i-1) div n+1,n-((i-1) mod n)]:=b[i];
 Writeln('Mang A la:');
 For i:=1 to n do
 begin
   For j:=1 to n do Write(a[i,j]:8); Writeln;
 end;
 Readln;
END.