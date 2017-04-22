Program P101211; {Kiem tra tinh chan le cua hoan vi bang cach
                  phan tich hoan vi thanh tich cua cac xich doc lap}
Uses Crt;
Var  a: array [1..100] of integer;
     x: array[1..100] of boolean;
     m,n,i,start,temp: integer;

Procedure Ghinhan(i: integer);
Begin temp:=a[i]; x[i]:=true; Inc(m); End;

BEGIN
 Clrscr;
 Write('Nhap so n<100: '); Readln(n);
 Writeln('Nhap cac phan tu cua hoan vi:');
 For i:=1 to n do read(a[i]); Readln;
 For i:=1 to n do x[i]:=false;
 i:=1;
 Repeat
   start:=i; Ghinhan(start);
   While temp<>start do Ghinhan(temp);
   Dec(m);
   i:=1; While x[i]=true do inc(i);
 Until i>n;
 If Odd(m) then Write('Hoan vi le.')
 Else Write('Hoan vi chan.');
 Readln;
END.