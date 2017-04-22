Program P100501;   {Tim phan tu lon nhat cua day so thuc}
Uses Crt;
Var  a: array[1..100] of real;
     n,i,iMax: integer;

BEGIN
 Clrscr;
 Write('Nhap do dai cua day so: n = '); Readln(n);
 Writeln('Nhap cac phan tu cua day so tren mot dong:');
 For i:=1 to n do Read(a[i]); Readln;
 iMax:=1; For i:=2 to n do If a[i]>a[iMax] then iMax:=i;
 Write('Phan tu lon nhat cua day so la a[',iMax,'] = ',a[iMax]:0:2);
 Readln;
END.