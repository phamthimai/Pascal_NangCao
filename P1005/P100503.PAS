Program P100503;   {Tim cuc tieu hang lon nhat cua  mang so thuc}
Uses Crt;
Var  a: array [1..50,1..50] of real;
     jMin: array [1..50] of integer;
     m,n,i,j,iMax: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang (m, n): '); Readln(m,n);
 Writeln('Nhap mang: ');
 For i:=1 to m do
 begin
   For j:=1 to n do Read(a[i,j]); Readln;
 end;
 For i:=1 to m do
 begin
   jMin[i]:=1;
   For j:=2 to n do If a[i,jMin[i]]>a[i,j] then jMin[i]:=j;
 end;
 iMax:=1;
 For i:=2 to m do If a[i,jMin[i]]<a[i,j] then iMax:=i;
 Write('Phan tu cuc tieu hang lon nhat cua mang la a[',
        iMax,',',jMin[iMax],'] = ',a[iMax,jMin[iMax]]:0:2);
 Readln;
END.