Program P101204;  {Kiem tra tinh chan le cua hoan vi}
Uses Crt;
Var  a: array[1..100] of integer;
     n,i,j,count: integer;

BEGIN
 Clrscr;
 Write('Nhap so n<=100: '); Readln(n);
 Writeln('Nhap mot hoan vi cua cac so 12...,',n,':');
 For i:=1 to n do Read(a[i]); Readln;
 count:=0;
 For i:=1 to n-1 do
   For j:=i+1 to n do If a[i]>a[j] then inc(count);
 If (count mod 2)=0 then Write('So nghich the la chan.')
 Else Write('So nghich the la le.');
 Readln;
END.