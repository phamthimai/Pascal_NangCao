Program P101203; {Dem so nghich the cua hoan vi}
Uses Crt;
Var  a: array[1..100] of integer;
     i,j,count,n: integer;
BEGIN
 Clrscr;
 Write('Nhap so n (n<=100): '); Readln(n);
 Writeln('Nhap mot hoan vi cua ',n,' so: ');
 For i:=1 to n do read(a[i]); Readln;
 count:=0;
 For i:=1 to n-1 do
   for j:=i+1 to n do
     if a[i]>a[j] then inc(count);
 Writeln('So nghich the la: ',count);
 Readln;
END.