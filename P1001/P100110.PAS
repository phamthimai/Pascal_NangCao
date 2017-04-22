Program P100110;   {Tinh tong sqrt(2+sqrt(2+sqrt(2+...)))}
Uses Crt;
Var  i,n: integer;
     s: real;
BEGIN
 Clrscr;
 Write('Nhap n = '); Readln(n);
 s:=0;
 i:=1;
 While i<=n do
 begin
   s:=sqrt(s+2);
   i:=i+1;
 end;
 Writeln('Gia tri bieu thuc la: ', s:3:10);
 Readln;
END.