Program P100108;  {Tinh dinh thuc cap 2}
Uses Crt;
Var  a,b,c,d,s: integer;
BEGIN
 Clrscr;
 Writeln('Nhap mot ma tran cap hai:');
 Readln(a,b);
 Readln(c,d);
 s:=a*d-b*c;
 Writeln('Dinh thuc cua ma tran bang: ',s);
 Readln;
END.
