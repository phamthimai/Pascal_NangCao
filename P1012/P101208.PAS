Program P101208; {Phan tich phep the thanh tich cac xich doc lap}
Uses Crt;
Var  a: array [1..100] of integer;
     x: array[1..100] of boolean;
     n,i,start,temp: integer;

Procedure Ghinhan(i: integer);
Begin temp:=a[i]; x[i]:=true; write(i,' '); End;

BEGIN
 Clrscr;
 Write('Hay nhap so n<100: '); Readln(n);
 Writeln('Hay nhap cac phan tu cua hoan vi:');
 For i:=1 to n do read(a[i]); Readln;
 For i:=1 to n do x[i]:=false;
 Writeln('Moi xich duoc viet tren mot dong nhu sau:');
 i:=1;
 Repeat
   start:=i; Ghinhan(start);
   While temp<>start do Ghinhan(temp); Writeln;
   i:=1; While x[i]=true do inc(i);
 Until i>n;
 Readln;
END.