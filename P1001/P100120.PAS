Program P100120;    {Tim diem chung cua cac doan thang}
Uses Crt;
Var  n,i: integer;
     a,b: array [1..100] of real;
     Maxa,Minb: real;

BEGIN
 Clrscr;
 Write('So luong cac doan thang: N = '); Readln(n);
 Writeln('Nhap mot day ',n,' doan thang (a<b):');
 Writeln('a[i]       b[i]');
 For i:=1 to n do Readln(a[i],b[i]);
 Maxa:=a[1];
 For i:=2 to n do If Maxa<a[i] then Maxa:=a[i];
 Minb:=b[1];
 For i:=2 to n do If Minb>b[i] then Minb:=b[i];
 If Maxa>Minb then
    Write('Khong co diem nao thuoc tat ca cac doan thang.')
 Else Write('Diem ',Maxa,' thuoc tat ca cac doan thang.');
 Readln;
END.