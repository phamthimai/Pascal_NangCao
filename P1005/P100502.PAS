Program P100502;   {Tim phan tu lon nhat cua  mang so thuc}
Uses Crt;
Var  a: array[1..50,1..50] of real;
     m,n,i,j,iMax,jMax: integer;

BEGIN
 Clrscr;
 Write('Nhap kich thuoc cua mang (m, n): '); Readln(m,n);
 Writeln('Nhap mang: ');
 For i:=1 to m do
 begin
   For j:=1 to n do Read(a[i,j]); Readln;
 end;
 iMax:=1; jMax:=1;
 For i:=1 to m do
   For j:=1 to n do
     If a[iMax,jMax]<a[i,j] then begin iMax:=i; jMax:=j; end;
 Write('Phan tu lon nhat cua mang la a[',iMax,',',jMax,'] = ',
                                            a[iMax,jMax]:0:2);
 Readln;
END.