Program P100215;    {Tim phan rieng cua doan thang}
Uses Crt;
Var  n,i: integer;
     a,b: array [0..100] of real;
     Max,Min: real;

BEGIN
 Clrscr;
 Write('Nhap mot doan thang (a<b):'); Readln(a[0],b[0]);
 Write('So luong cac doan thang: N = '); Readln(n);
 Writeln('Nhap mot day ',n,' doan thang (a[i]<a hoac b[i]>b):');
 Writeln('a[i]       b[i]');
 For i:=1 to n do Readln(a[i],b[i]);
 Max:=a[0];
 For i:=1 to n do If (a[i]<a[0])and(Max<b[i]) then Max:=b[i];
 Min:=b[0];
 For i:=1 to n do If (b[i]>b[0])and(Min>a[i]) then Min:=a[i];
 If Max>Min then Write('Khong co diem nao thuoc rieng doan thang [',a[0]:0:1,',',b[0]:0:1,'].')
 Else Write('Doan [',Max:0:1,',',Min:0:1,'] thuoc rieng doan thang [',a[0]:0:1,',',b[0]:0:1,'].');
 Readln;
END.