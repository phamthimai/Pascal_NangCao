Program P101201;      {Kiem tra mot hoan vi cua 123...n}
Uses Crt;
Var  a,k:array[1..100] of integer;
     i,j,n:integer;
     OK: Boolean;

BEGIN
 Clrscr;
 Write('Nhap so n<=100): '); Readln(n);
 Writeln('Nhap mot day ',n,' so nguyen: ');
 For i:=1 to n do read(a[i]); Readln;
 For i:=1 to n do                {dem so = i trong mang}
   For j:=1 to n do If a[j]=i then inc(k[i]);
 OK:=true;
 For i:=1 to n do if k[i]<>1 then OK:=false;
 If OK then Writeln('Day la mot hoan vi cua 12...',n)
 Else  Writeln('Day khong phai la mot hoan vi cua 12...',n);
 Readln;
END.