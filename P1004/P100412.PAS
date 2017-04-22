Program P100412;   {Lap mang B tu mang A}
Uses Crt;
Var a: array[1..50,1..50] of integer;
    Tong,Tich,Min,Max: array[1..50] of integer;
    i,j,m,n: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang A (m,n): '); Readln(m,n);
 Writeln('Nhap mang A: ');
 For i:=1 to m do
 begin
   For j:=1 to n do Read(a[i,j]); Readln;
 end;
 For i:=1 to m do
 begin
   Tong[i]:=0; Tich[i]:=1; Min[i]:=MaxInt; Max[i]:=-MaxInt;
   For j:=1 to n do
   begin
     Tong[i]:=Tong[i]+a[i,j];
     Tich[i]:=Tich[i]*a[i,j];
     If Min[i]>a[i,j] then Min[i]:=a[i,j];
     If Max[i]<a[i,j] then Max[i]:=a[i,j];
   end;
 end;
 Writeln('Ma tran B la:');
 Writeln(' a.Tong:  b.Tich:    c.Min:  d.Trung binh cong:  e.Max-Min: ');
 For i:=1 to m do
   Writeln(Tong[i]:6,Tich[i]:10,Min[i]:10,Tong[i]/n:20:2,Max[i]-Min[i]:12);
 Readln;
END.