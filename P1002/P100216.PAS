Program P100216;    {Tim phan rieng cua doan thang, tong quat}
Uses Crt;
Var  n,i,OK: integer;
     C: set of byte;
     a,b: array [0..100] of real;
     t,s: real;

BEGIN
 Clrscr;
 Write('Nhap mot doan thang (a<b):'); Readln(a[0],b[0]);
 Write('So luong cac doan thang: N = '); Readln(n);
 Writeln('Nhap mot day ',n,' doan thang:');
 Writeln('a[i]   <=  b[i]');
 For i:=1 to n do Readln(a[i],b[i]);
 C:=[1..n];
 t:=a[0];
 Repeat
   If t>=b[0] then OK:=-1
   Else
   begin
     i:=0; Repeat inc(i) Until ((i in C)and(a[i]<=t))or(i>n);
     If i>n then OK:=1
     Else
     begin
       If t<b[i] then t:=b[i];
       C:=C-[i];
     end;
   end;
 Until (C=[])or(OK<>0);
 If OK=-1 then Write('Khong co diem nao thuoc rieng doan thang [',a[0]:0:1,',',b[0]:0:1,'].')
 Else
 begin
   s:=b[0];
   For i:=1 to n do If (a[i]>t)and(a[i]<s) then s:=a[i];
   Write('Doan [',t:0:1,',',s:0:1,'] thuoc rieng doan thang [',a[0]:0:1,',',b[0]:0:1,'].');
 end;
 Readln;
END.